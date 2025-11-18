#!/usr/bin/python3
# SPDX-FileCopyrightText: 2025 Ryoichi Sakamaki
# SPDX-License-Identifier: BSD-3-Clause

"""やりたい事のメモ
周波数の入力

音階名の表示,何番目のその音か
442hzで共鳴する適切な周波数まであとどのくらいか
27.625kaara4205.036
音域表示は国際式を用いる基準がA4の442Hz
"""
import sys


def heikinritu(n):
    return 442 * 2 ** (1 / 12 * (n-49))


onmei = ["A", "B", "H", "C", "Ds", "D", "Es", "E", "F", "Gs", "G", "As"]
onmeinamber = 0
freq = float(sys.stdin.read())


if (freq < 27.5) or (4186.009 < freq):
    print("errer")
    exit()

for i in range(1, 89):
    if (i % 12 == 0):
        onmeinamber += 1

    if (heikinritu(i - 0.5) <= freq) and (freq < heikinritu(i + 0.5)):
        onmei = onmei[i % 12 - 1]
        difference = round(heikinritu(i) - freq, 3)
        break

print(onmeinamber,onmei, difference)


