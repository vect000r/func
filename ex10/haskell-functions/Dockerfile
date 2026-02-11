FROM haskell:9.4

WORKDIR /app

COPY stack.yaml ex10.cabal ./

RUN stack update && stack build --only-dependencies

COPY . .

RUN stack build

CMD ["stack", "exec", "ex10"]