#Tema 2 SO - Test 7
#Test in care se testeaza ce se intampla cand se umple memoria
echo "Started test 7 ..."
cd ..
./server &>/dev/null
sleep 0.5
./client a 0 a 1 a 2 a 3 a 4 a 5 a 6 a 7 a 8 a 9 a 10 a 11 a 12 a 13 a 14 a 15 a 16 a 17 a 18 a 19 a 20 a 21 a 22 &
./client a 23 a 24 a 25 a 26 a 27 a 28 a 29 a 30 a 31 a 32 a 33 a 34 a 35 a 36 a 37 a 38 a 39 a 40 a 41 a 42 a 43 a 44 a 45 &
./client a 46 a 47 a 48 a 49 a 50 a 51 a 52 a 53 a 54 a 55 a 56 a 57 a 58 a 59 a 60 a 61 a 62 a 63 a 64 a 65 a 66 a 67 a 68 &
./client a 69 a 70 a 71 a 72 a 73 a 74 a 75 a 76 a 77 a 78 a 79 a 80 a 81 a 82 a 83 a 84 a 85 a 86 a 87 a 88 a 89 a 90 a 91 &
./client a 92 a 93 a 94 a 95 a 96 a 97 a 98 a 99 a 100 a 101 a 102 a 103 a 104 a 105 a 106 a 107 a 108 a 109 a 110 a 111 a 112 a 113 a 114 &
./client a 115 a 116 a 117 a 118 a 119 a 120 a 121 a 122 a 123 a 124 a 125 a 126 a 127 a 128 a 129 a 130 a 131 a 132 a 133 a 134 a 135 a 136 a 137 &
./client a 138 a 139 a 140 a 141 a 142 a 143 a 144 a 145 a 146 a 147 a 148 a 149 a 150 a 151 a 152 a 153 a 154 a 155 a 156 a 157 a 158 a 159 a 160 &
./client a 161 a 162 a 163 a 164 a 165 a 166 a 167 a 168 a 169 a 170 a 171 a 172 a 173 a 174 a 175 a 176 a 177 a 178 a 179 a 180 a 181 a 182 a 183 &
./client a 184 a 185 a 186 a 187 a 188 a 189 a 190 a 191 a 192 a 193 a 194 a 195 a 196 a 197 a 198 a 199
./client a 0 a 1 a 2 a 3 a 4 a 5 a 6 a 7 a 8 a 9 a 10 a 11 a 12 a 13 a 14 a 15 a 16 a 17 a 18 a 19 a 20 a 21 a 22 &
./client a 23 a 24 a 25 a 26 a 27 a 28 a 29 a 30 a 31 a 32 a 33 a 34 a 35 a 36 a 37 a 38 a 39 a 40 a 41 a 42 a 43 a 44 a 45 &
./client a 46 a 47 a 48 a 49 a 50 a 51 a 52 a 53 a 54 a 55 a 56 a 57 a 58 a 59 a 60 a 61 a 62 a 63 a 64 a 65 a 66 a 67 a 68 &
./client a 69 a 70 a 71 a 72 a 73 a 74 a 75 a 76 a 77 a 78 a 79 a 80 a 81 a 82 a 83 a 84 a 85 a 86 a 87 a 88 a 89 a 90 a 91 &
./client a 92 a 93 a 94 a 95 a 96 a 97 a 98 a 99 a 100 a 101 a 102 a 103 a 104 a 105 a 106 a 107 a 108 a 109 a 110 a 111 a 112 a 113 a 114 &
./client a 115 a 116 a 117 a 118 a 119 a 120 a 121 a 122 a 123 a 124 a 125 a 126 a 127 a 128 a 129 a 130 a 131 a 132 a 133 a 134 a 135 a 136 a 137 &
./client a 138 a 139 a 140 a 141 a 142 a 143 a 144 a 145 a 146 a 147 a 148 a 149 a 150 a 151 a 152 a 153 a 154 a 155 a 156 a 157 a 158 a 159 a 160 &
./client a 161 a 162 a 163 a 164 a 165 a 166 a 167 a 168 a 169 a 170 a 171 a 172 a 173 a 174 a 175 a 176 a 177 a 178 a 179 a 180 a 181 a 182 a 183 &
./client a 184 a 185 a 186 a 187 a 188 a 189 a 190 a 191 a 192 a 193 a 194 a 195 a 196 a 197 a 198 a 199
./client s 3000 p | perl _test/tree.pl _test/test7.in
if [ $? -eq 0 ]
then
	echo "-- PASSED --"
else
	echo "-- FAILED --"
fi
./client e
echo
