# H100 SXM5 80GB HBM3

- device 0: clock freq: set to 1590 MHz, ncu report 1440 MHz
- device 1-7: clock freq: 1980 MHz, ncu report 1780 MHz
- pipelined: `bash compile.sh NONE NONE NONE NONE NONE NONE NONE NONE`
```
./fmha_forward
Using device 0: NVIDIA H100 80GB HBM3  (SM90, 132 SMs)
M = 4096
N = 4096
K = 64
QBLK = 64
KBLK = 64
L = 128 : 32 * 4
CUTE_FMHA:     [384852.4]Gflop/s  (1.4285)ms
```
```
./fmha_forward --prec-type=1
Using device 0: NVIDIA H100 80GB HBM3  (SM90, 132 SMs)
M = 4096
N = 4096
K = 64
QBLK = 64
KBLK = 64
L = 128 : 32 * 4
CUTE_FMHA:     [308375.4]Gflop/s  (1.7827)ms
```
```
./fmha_forward --prec-type=1 --device=4
Using device 4: NVIDIA H100 80GB HBM3  (SM90, 132 SMs)
M = 4096
N = 4096
K = 64
QBLK = 64
KBLK = 64
L = 128 : 32 * 4
CUTE_FMHA:     [384203.4]Gflop/s  (1.4309)ms
```

- warp-specilized: `bash compile.sh EXECMODE=1 NONE NONE NONE NONE NONE NONE NONE`
```
./fmha_forward --prec-type=2
Using device 0: NVIDIA H100 80GB HBM3  (SM90, 132 SMs)
M = 4096
N = 4096
K = 64
QBLK = 64
KBLK = 64
L = 128 : 32 * 4
CUTE_FMHA:     [178868.0]Gflop/s  (3.0735)ms
```
```
./fmha_forward --prec-type=1
Using device 0: NVIDIA H100 80GB HBM3  (SM90, 132 SMs)
M = 4096
N = 4096
K = 64
QBLK = 64
KBLK = 64
L = 128 : 32 * 4
CUTE_FMHA:     [168871.1]Gflop/s  (3.2555)ms
```

- non-pipelined: `bash compile.sh EXECMODE=2 NONE NONE NONE NONE NONE NONE NONE`
```
./fmha_forward --prec-type=2
Using device 0: NVIDIA H100 80GB HBM3  (SM90, 132 SMs)
M = 4096
N = 4096
K = 64
QBLK = 64
KBLK = 64
L = 128 : 32 * 4
CUTE_FMHA:     [371524.5]Gflop/s  (1.4797)ms
```
```
./fmha_forward --prec-type=1
Using device 0: NVIDIA H100 80GB HBM3  (SM90, 132 SMs)
M = 4096
N = 4096
K = 64
QBLK = 64
KBLK = 64
L = 128 : 32 * 4
CUTE_FMHA:     [343755.8]Gflop/s  (1.5993)ms
```

- pipelined: `bash compile.sh QINRMEM NONE NONE NONE NONE NONE NONE NONE`
