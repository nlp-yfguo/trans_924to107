#!/bin/bash

set -e -o pipefail -x

export cachedir=/home/yfguo/Data_Cache/wmt16/wmt16_notruecase/

export dataid=rs

export srcd=/home/yfguo/Data_Cache/wmt16/wmt16_notruecase/
export srcvf=src.test.en.tok
export tgtvf=tgt.test.de.tok

export vratio=0.2
export rratio=0.6
export maxtokens=256

export bpeops=32000
export minfreq=8
export share_bpe=true

export tgtd=$cachedir/$dataid

mkdir -p $tgtd

export src_cdsf=$tgtd/bpe.cds
export tgt_cdsf=$tgtd/bpe.cds

subword-nmt apply-bpe -c $src_cdsf --vocabulary $tgtd/src.vcb.bpe --vocabulary-threshold $minfreq < $srcd/$srcvf > $tgtd/src.test.bpe &
subword-nmt apply-bpe -c $tgt_cdsf --vocabulary $tgtd/tgt.vcb.bpe --vocabulary-threshold $minfreq < $srcd/$tgtvf > $tgtd/tgt.test.bpe &


