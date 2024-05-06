CUTLASS_DIR=/home/msra/v-feiychen/projects/cutlass
CUDA_DIR=/usr/local/cuda-12.2

${CUDA_DIR}/bin/nvcc --use_fast_math -forward-unknown-to-host-compiler -I../../lib/ -I ../../include  -I${CUTLASS_DIR}/include -I${CUTLASS_DIR}/examples/common -I"${CUDA_DIR}/include" -I/include -I/examples -I${CUTLASS_DIR}/tools/util/include -O3 -DNDEBUG --generate-code=arch=compute_90a,code=[sm_90a]  -Xcompiler=-fPIE -DCUTLASS_ENABLE_TENSOR_CORE_MMA=1  --expt-extended-lambda --expt-relaxed-constexpr -DCUTLASS_TEST_LEVEL=0 -DCUTLASS_TEST_ENABLE_CACHED_RESULTS=1 -DCUTLASS_CONV_UNIT_TEST_RIGOROUS_SIZE_ENABLED=1 -DCUTLASS_DEBUG_TRACE_LEVEL=0 -Xcompiler=-Wno-psabi -Xcompiler=-fno-strict-aliasing -Xnvlink=--verbose -Xptxas=--verbose  -std=c++17 -MD -MT -MF -x cu  fmha_forward.cu -Wl,-rpath,'${CUDA_DIR}/lib64' -Wl,-rpath,'${CUDA_DIR}/lib' -lcuda  -lcudadevrt -lcudart_static -lcublas -lrt -lpthread -ldl -o fmha_forward_fp8 -DGEMM2FP8 -DQBLKSIZE=128 -DKBLKSIZE=128 -DCTA256 -DQINRMEM