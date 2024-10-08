# ベースイメージ
FROM ruby:3.1.2

ENV RAILS_ENV=production
ENV TZ Asia/Tokyo
ENV LANG ja_JP.UTF-8
ENV LC_ALL C.UTF-8
ENV EDITOR=vim

# dbにpostgreSQLを使用するので対象のパッケージをインストール
RUN apt-get update && apt-get install -y postgresql-client vim

# Node.jsとYarnをインストール
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
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

RUN bundle install

# ソースコードをコピー
COPY . /app_name

# # YarnインストールとTailwindCSSの設定
RUN yarn install --check-files && \
yarn add tailwindcss postcss autoprefixer esbuild daisyui axios && \
npx tailwindcss init

# TailwindCSSの初期化と設定
RUN echo 'module.exports = { content: ["./app/views/**/*.html.erb", "./app/helpers/**/*.rb", "./app/assets/stylesheets/**/*.css", "./app/javascript/**/*.js"], theme: { extend: {}, }, plugins: [require("daisyui")], daisyui: { themes: ["cupcake"] }, }' > tailwind.config.js

# PostCSSの設定
RUN echo 'module.exports = { plugins: [ require("tailwindcss"), require("autoprefixer"), ], }' > postcss.config.js

# TailwindCSSのビルド
RUN yarn run tailwindcss -i ./app/assets/stylesheets/application.tailwind.css -o ./app/assets/stylesheets/application.css --minify

# `esbuild`ビルドの修正
RUN yarn run esbuild app/javascript/*.* --bundle --sourcemap --format=esm --outdir=app/assets/builds --public-path=/assets

# アセットをプリコンパイルするための環境変数を設定
ARG SECRET_KEY_BASE
ENV SECRET_KEY_BASE=$SECRET_KEY_BASE

# アセットをプリコンパイル
RUN bundle exec rake assets:precompile

# ポートを指定
EXPOSE 3000

# サーバー起動コマンド
CMD ["bin/rails", "server", "-b", "0.0.0.0", "-p", "3000"]

# entrypoint.shを実行するための記述
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]