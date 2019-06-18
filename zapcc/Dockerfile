FROM ubuntu:18.04 as zapcc
RUN apt-get update && apt-get install -y \
    cmake \
    g++ \
    git \
    ninja-build \
    python \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# zapccのリポジトリをクローン
RUN git clone https://github.com/yrnkrn/zapcc.git

# zapccのビルドとパスの追加
WORKDIR zapcc/build
RUN cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF -DLLVM_ENABLE_WARNINGS=OFF -DLLVM_ENABLE_BACKTRACES=OFF -DLLVM_ENABLE_MODULE_DEBUGGING=OFF -DLLVM_ENABLE_LOCAL_SUBMODULE_VISIBILITY=OFF .. \
 && ninja -j3

FROM ubuntu:18.04
WORKDIR /zapcc/build
COPY --from=zapcc /zapcc/build .
ENV PATH /zapcc/build/bin:$PATH

