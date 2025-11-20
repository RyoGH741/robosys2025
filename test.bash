#!/bin/bash
# SPDX-FileCopyrightText: 2025 Ryoichi Sakamaki 　　　　　
# SPDX-License-Identifier: BSD-3-Clause

ng () {
	echo ${1}行目が違う
	res=1
}

res=0

#正常な動作
out=$(echo 440 | ./tuner)
[ "${out}" = "A4  2.0" ] || ng "$LINENO"

out=$(echo 27.5 | ./tuner)
[ "$?" = 0 ]      || ng "$LINENO"
#[ "${out}" = "" ] || ng "$LINENO"
echo $out
out=$(echo 30.8 | ./tuner)
[ "$?" = 0 ]      || ng "$LINENO"
#[ "${out}" = "" ] || ng "$LINENO"
echo $out
out=$(echo 32.7 | ./tuner)
[ "$?" = 0 ]      || ng "$LINENO"
#[ "${out}" = "" ] || ng "$LINENO"
echo $out
out=$(echo 3951 | ./tuner)
[ "$?" = 0 ]      || ng "$LINENO"
#[ "${out}" = "" ] || ng "$LINENO"
echo $out
out=$(echo 4186 | ./tuner)
[ "$?" = 0 ]      || ng "$LINENO"
#[ "${out}" = "" ] || ng "$LINENO"
echo $out
#異常な動作
out=$(echo 10 | ./tuner)
[ "$?" = 0 ]      || ng "$LINENO"
#[ "${out}" = "" ] || ng "$LINENO"
echo $out

out=$(echo -10 | ./tuner)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "Out of tuner measurement range" ] || ng "$LINENO"

out=$(echo 5000 | ./tuner)
[ "$?" = 0 ]      || ng "$LINENO"
#[ "${out}" = "" ] || ng "$LINENO"
echo $out
out=$(echo a | ./tuner)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo あ | ./tuner)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo | ./tuner)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo ! | ./tuner)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo 44 0 | ./tuner)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo 44! | ./tuner)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo 44a | ./tuner)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo 44あ | ./tuner)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK

exit $res