FROM bitwalker/alpine-elixir-phoenix:1.8.0 AS build
WORKDIR /app
COPY . .
ENV MIX_ENV=prod
RUN source .env && \
  mix distillery.release && \
  cp ./_build/prod/rel/article_viewer/releases/1.0.0/article_viewer.tar.gz .

FROM bitwalker/alpine-elixir-phoenix:1.8.0
WORKDIR /app
COPY --from=build /app/article_viewer.tar.gz .
RUN tar -zxf article_viewer.tar.gz && \
  rm -f article_viewer.tar.gz && \
  mkdir /app/logs && \
  chmod 777 -R /app/logs && \
  source .env
  ENV MIX_ENV=prod

ENTRYPOINT ["bin/article_viewer"]
CMD ["foreground"]
