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
[ "$?" = 0 ]      || ng "$LINENO"
[ "${out}" = "A4 2.0" ] || ng "$LINENO"

#範囲内で極端に小さいとき
out=$(echo 10 | ./tuner)
[ "$?" = 0 ]      || ng "$LINENO"
[ "${out}" = "Undefined0 17.625" ] || ng "$LINENO"

#範囲内で極端に大きいとき
out=$(echo 5000 | ./tuner)
[ "$?" = 0 ]      || ng "$LINENO"
[ "${out}" = "Undefined8 -794.964" ] || ng "$LINENO"

#異常な動作

#0の時
out=$(echo 0 | ./tuner)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

#0以下の時
out=$(echo -10 | ./tuner)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

#アルファベットが入った時
out=$(echo a | ./tuner)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

#ひらがな入った時
out=$(echo あ | ./tuner)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

#何も入らなかった時
out=$(echo | ./tuner)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

#記号が入った時
out=$(echo ! | ./tuner)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

#間にスペースが入った時
out=$(echo 44 0 | ./tuner)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

#記号と混じった時
out=$(echo 44! | ./tuner)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

#アルファベットと混じった時
out=$(echo 44a | ./tuner)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

#ひらがなと混じった時
out=$(echo 44あ | ./tuner)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK

exit $res