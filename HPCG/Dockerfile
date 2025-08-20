# Base image with compilers & MPI
FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    mpich \
    wget \
    git \
    && rm -rf /var/lib/apt/lists/*

# Get HPCG source
WORKDIR /opt
RUN git clone https://github.com/hpcg-benchmark/hpcg.git
WORKDIR /opt/hpcg

# Build HPCG
RUN mkdir build && cd build && \
    cmake .. -DCMAKE_C_COMPILER=mpicc -DCMAKE_CXX_COMPILER=mpicxx && \
    make -j$(nproc)

# Default command: run HPCG with 4 MPI ranks
COPY hpcg.dat /opt/hpcg/build/hpcg.dat
WORKDIR /results
COPY hpcg.dat /results
CMD ["mpirun", "-np", "4", "/opt/hpcg/build/xhpcg"]
