# ベースイメージ
FROM ruby:3.1.2

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

# Fly.io CLIのインストール
RUN curl -L https://fly.io/install.sh | sh

# Fly.io CLIをパスに追加
ENV PATH="/root/.fly/bin:${PATH}"

# ポートを指定
EXPOSE 3000

# サーバー起動コマンド
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
