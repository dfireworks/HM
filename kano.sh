#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�Έbkano.sh �SAN�0���p��/�C�(��T�88�618����Կ�&P��T�%3���x}x c�d�B��,��-ψ�0�25��q_c.'�9�ji� =XP��� �Lp�,���X��ytz��0�F\R^�y�ԏ�J��	%�(�]	�e�ҢV����2�����N��<��ƴ"~v6]�� �(Vu�׀�}2^-a1�|� ��V��)�KE�.{M�q1�.	��y]�kPk
�T�Gw��q�Cy$�X���#@T5�XkV[���7��N�	��=�/�N�r}�m'H@�EA��Ρ��۲��򇽻r@3�o�?bG� ���d����K��Ym��$���[�j��k�xuu�Ԥ�{g���@/�  