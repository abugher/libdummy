#Problem

`libdrm`, as implemented in the OS for a Jetson Nano, does not
implement `drmIsKMS`.  `mpv`, as provided by Ubuntu Noble, fails immediately,
citing this undefined symbol.


#Solution

This library "implements" `drmIsKMS` as a function that just returns
zero.  Build it on the host with `make`.  Then instruct `mpv` to use the
library with the `LD_PRELOAD` variable.

    cd /path/to/libdummy
    make

    LD_PRELOAD=/path/to/libdummy/libdummy.so mpv


#Results

Mixed.  `mpv` is failing for other reasons, now.  This part seems to
work, though.  The return code of `0` indicates that KMS is unavailable, and
that is probably correct information.  I tried setting the return code to `1`,
but that resulted in a non-operative mpv with no interesting output.
