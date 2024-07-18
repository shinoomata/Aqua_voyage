# ベースイメージ
FROM ruby:3.1.2

ENV RAILS_ENV=production
ENV TZ Asia/Tokyo
ENV LANG ja_JP.UTF-8
ENV LC_ALL C.UTF-8
ENV EDITOR=vim

#dbにpostgreSQLを使用するので対象のパッケージをインストール
RUN apt-get update && apt-get install -y postgresql-client vim

# Node.jsとYarnをインストール
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y nodejs yarn

# ディレクトリ作成
RUN mkdir /app_name
WORKDIR /app_name

# GemfileとGemfile.lockをコピー
COPY Gemfile /app_name/Gemfile
COPY Gemfile.lock /app_name/Gemfile.lock

# gemインストール
RUN bundle install

# ソースコードをコピー
COPY . /app_name

# Yarnインストール
RUN yarn install --check-files

# アセットをプリコンパイルするための環境変数を設定
ARG SECRET_KEY_BASE
ENV SECRET_KEY_BASE=$SECRET_KEY_BASE

# アセットをプリコンパイル
RUN bundle exec rake assets:precompile

# TailwindCSSをインストール
RUN yarn add tailwindcss

# TailwindCSSの初期化
RUN npx tailwindcss init

# Fly.io CLIのインストール
#RUN curl -L https://fly.io/install.sh | sh

# Fly.io CLIをパスに追加
#ENV PATH="/root/.fly/bin:${PATH}"

# ポートを指定
EXPOSE 3000

# サーバー起動コマンド
CMD ["bin/rails", "server", "-b", "0.0.0.0"]

#後述のentrypoint.shを実行するための記述
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]