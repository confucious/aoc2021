//
//  main.swift
//  day25
//
//  Created by Jerry Hsu on 12/24/21.
//

import Foundation

let sample = """
v...>>.vv>
.vv>>.vv..
>>.>v>...v
>>v>>.>.v.
v>v.vv.v..
>.>>..v...
.vv..>.>v.
v.v..>>v.v
....v..v.>
"""

let data = """
..v.v>v......v>vv....>...>>.>>..>>.v>v>vv..v>.....vv..v.>...>.>.v>..>>....>..vv..v.v...v>.v>>>>>v>..>>..>v..v>>....v..v..>.>>....v.>..>.>>.
v>>.>.>v>v>v.vv>.>>vv>.>.>v..v>.>..>.v.vv>v.>v.>v.vvv.>..>.....v.v>.>..v....v..v>>>.>vvv>..v.......>>v..v..>.>.>.....v.v..>v.v>.>...vvv.>..
.v.>.>vvv>.v>>>..v>..>v............>.>..vv>>..vvv........>v>v.v>...v>.v.>.>v...>...>.vv...v>.>>.>.v>>...>v.v..>..v>vv.>v..v....vv.v>..v..v.
>...v...>.>..v........vvv>.vv>.v...v...v.>.v>v>.>v...>>>.v.vvv.v.vvv>..v..v.v>....v>v>..v>.>.>.>>>>>>>>v>.>v>vvv..>>.>.vv.>v>>>v..vvvv..>v>
>vv>.v>...vvv.>.>v>>>..>.>.>v.......v>..v.vv>v>.>..v..v>v.......>.v...>>v..>>.v.vvv.>v>v.>.>>vv...v>>.v.>>....v.vvvvv..v..>v..v>>v....v....
v...v..>v.v>.v..>........vv.>>...v.v>v>.>v>..vv.v..v.v...v>.>..>....vv..vv..vv>.v>>>v.....vvv.>>..v....>.>v.v>.>>>vvv.....v...v..>.>v>.>>>.
>.v.>...v.........>.>v..>v>...>.>.>>>..v>..>...vv>v......>.v.>v.v>..>...>v...>vvv...>...v.....>vv>..vv>>.>...>..>v.v...>>.v...>v>vv>.....>.
..v....v....vv...>v>>vv>>>vv....>.vv..v>.>.v.>v..>>vv...>v>vv>>>..vv..v...v>.>vv>>.>..v.>...>....v.v...v.>...>v.>..>.v>v.>>...v..>v........
>.v>.>.>v>v..>.>>>.>v>v.>>.>vv>...>.v..v.v.v..>>>.>.>>>.v.>.>v...>>.>....>.>...>..vv.....>>>...v>>.vvv>>>.>>v.v..vv.vv.v>>...vv.....>..>v..
>....>..>..v...v>.>.v.........v.>.>>....>>.vv>>>>>...>..v.>.>>.>>v.....>.>v>...v...>>..>...v....>>v.v.v...vv>>..v.>>>>.v>v>>v..>>.v.v..v>..
.>v>>.v..v.v>>.>.>..>v>>v.v>>>>..>.>.v.v.>v>vv>.v..v>..>v>.vv.>>....v...>>.vvv.v..v>v.v...v.v>>.vv>vv..>.>.>.>>>vv>v.>..v...>..>..>>>>..vv.
v>..vvv..v.....v>.>.>....>vv....>.>.>.>v>vv>>.v...v........>vv>vvvvv>>>....v>....>.>...>.v>v>>v.vv..>v>v>vv.v...>vvvvv..vv>..>>vv..>>.>>.>.
>..>....v...>.>vv.v..>..>.>.v>.vv....vvv>>v.....v>........>>v....v..v>.vv..v>.v>v.v>.>v.v..>vv...>..>...v>v>....vv.>vv.>.v.v..>v...>.>>vv>v
.>.vvv>>.>.v>v.>.....vvv.v.>.>>v>....>v.>.v.v...>>>.>.>v>.v....>v.>.v>>v>....vv.v.vv>v>v>v.>..>.>.>v..>>vv...>..>>v>..v....>.v....>.v..>..v
>.v....v.>...vvvv>v.vv..>vvv>.vv......v.v..vv...>>v.>>..v.....>..vvv>v>.>...v....vv.v.>..v.v..v.>.>.>..>.>.>>vv.v.>v.v.vv.v.>>>>v..v.>v>>..
v.vv>.....vv>vv>>..v>.vv.v..>.v..v..v.v..>>>>>v..........v>.vv>.>....>.>.v.vv>..>......>..v>vvv.>vv.>.>.v.v..>.v.>>.v.v...>.v>>..>>.vv.v.v.
>v...v>....v.>..v.>vvv.>.>v.v>v>>>v>>>v>.>..v>.>....>..v...v>.>>v.>.>.>v.vv>>>vv.v.>>.>>.>vv..v.>>..>>v...>v..>v.....>>>v....>.>.>v...>v>vv
.>....v.v.vv>...>..v.>>.>v.v.v..>...>>>.>..v..>..>.....v>vv..v>v>>..v....>>>v...>.>>vv>.....>>>..>....>.v>v.v>>>>>vv.....vvv>>vv..v...vv...
>...>..vv>vv.vv.>..v.....vv>vvv.>v...v...v>....vv...>......v..v>v>...vv......>v.>vv>.v>..v.v..>>..>.v>.......v>..vv>....v.>....>>...>..v..v
.....>.>....v>>.>v.v.v>..v.v>.v.vvv..>>.>.>.v.....v...vv.>v......>v>.>.>.vvv..>.>>.vvv.v>.v.....v...>.v>.>>.>.v>v>>>>....>vvv.......>.>>>.v
>vv..v..v.>.>v>v>>...v...vv..>.v.>>v.>....v.>>>v...>....v.>.>>.>v...vv..>..>......>>.>v...>..v.>vvv..>>.v.v>....vv.>v..v>>..vv.>>...v.>.vvv
v>..v...>>..v.v.vv>.>..v>...v.>..>>.>.>>v...v.>>>.>v...v>......>v.>.>.v>..v...vvvv..v.v.>v.v.v...vv>>.>.>>...v.>v....>>.>..v...>....v..v>v>
..vvvvv.v.v...>v>...v>.vv..v.v.v>v.....v>v.vv..>.vvv.>v..vv>.>.>.v>....>>v.>.vv.>.>.>v..vv>v>>...v.v...v>.v...>vv.>>>>...v>....>...>..v....
..v>vv>>..vv..v..vv>vvv>>v>.>.>>v.v...vv.v..>>>.>.>..v.v>>...>>>..>.>.>v..vv..v.>..vv..>v.>>>.>v..v.....>......>.>....>.vv.>>.>>>>>.>>vv>v.
>>.>>..>>.vv.vvv.>...v>..v>.v>...vv.>vv>...v.v>..>.>v.>>v.vv..>....>>.v.....v>>>v>>>...>.....v>v..v..v>v>>.v>.v.v.v>...>.v>.>....>...v.v.v.
>v.v>.v.>>>.v.vv.>.>.v.v.v>>..v..v.v........vv>..v>>v.>>.>.v.>>v>........>.v>..v..v..>v.v>..vvv>.vv>v.vv..v>>..>.v...v..v.>..v.>..>.>..>>v.
>v>.>..>...v.>>....>v.vv...>>vvv.v>vv>v.......>.vv>.v.....>..>>.v.v>v.v......>.>v.>>..>v.v>....v>......v.v.>.vv>..v>v>>v>>.vvvv..vv.>..>>.v
..>..v>>>v.>.v.>v..>v.....>vv..v>>..>.vv.v.>.>>..vv.>>>>..v>..vvv.>...v...........>v.>........v>>v.>.v>v.v>..>....>.v>..vv.v>..v...........
>>....v......>..>.v>..>..>>>.>.vv..>v.v..v.vv..v..>vv>>v.>.>>vvv>v.....v..v>..v>>..>>.>vvv.>>..>>v.>..v..>...v>...>.v...v.>.>v.>v..>.>.vvv.
v.vv>.v..v.vv>.v..>vvv.>v.......v.v>....>v.>>.>v..v>.>>..>..v.>.....>v.v>.v.v>vv.v>.v...v.>..vv.v..vv.v....v>...>..>>.v.v..>>......v>..>...
.v.vv>>..v.>...>.v..v.>...v.>>.v...v..vv>.>v..v.>v.v.v.>..v..>.>>.>.>v..v.>.v>v.v..>v>..v.v>>.>..>.v.>>.v.>vv>v...vvv..>vv.vvv>..v>...>.vv>
.>v..v.......v.>.....>v>..v>.vv>vv.v>...>.>>..>>.>v>v.>.>v.>.v..vv..v.>v..vvvv.>v...>v..vv..>.vv.>..v>v>>.v>...>>.v>>.....v..>..>>...>.>vvv
>.>>...>....vv.v>v.>...>>.v..>v>.>.vv...>>v>v>..v..>v.>v.v.v>.....vv>v>vv.v...>.v..>.v>v.v..>>....>v.>.....>....v..>.>v..>v.>.vv>....>.>v.v
..>.>..>.v.>.>.v.>vv..>>.v>.>..v>v.v..>v.....vv.v.v....v.>..v..>...>.>...>.>.v.>..v..>v>.v.>.>>...v>>..vvv.v.v>....vvv......>.v.v......>v.>
.>v.v..>.>>.>.>>.>v.>.>.>>>.>vv..v>>vv>.>.>vv>>.>vv>.>>.v>v.v.>>v>.....>....>.v>..>.>......>....v>v>.>v.v.v..v..>.>...>>.v.v>.>v.>......v>>
..v.v.>>v.>>..v...>>>vvvv.vvvvv..v......vv...>v>>.v..>>.v..vvv...>...vv.>.>....>>.v..v>v>.>>>v>>v.....v>.>.>..>>.v..v.>vv.v.v>v.>>.>>>v..vv
...>..v.vv.>>..>v.>v>>>.vv>...v>....v...>..>..>>.>....>.>>>>.vv...v>>v.v...>v.>>....>.>.>>v.>...v..v..>....>...>>.vv.>>>>v.>>>.>..>..>.v>..
v...vv>.v>.v.v...>..>>.v...>.>v...>...>v>v>...v.v...v>v.v>>>.v.vv..v>v.v...>>.v>..>>.>vv>v..v>vv.>>>.>>>>..v..v>..>.v>.>vv>v>.v>....v>>>.v.
vvv.v...>.>.>>.v....>vvvv>....v>.vv.v.v.....v.>v..v.......v..v.v..>..vv...>v...>.v>.v..>>..vv.v....v>.v..v..vv.....>.>.>.>..vvv.>..>..>.v>.
>..>>vv>>v>.>..>...v..vv>v.>.>...v>>>>>v.v.>v>..v>..vv...>v>..vv>>.>....>>.v>v.vv>.>.>..>vv.>v>.vv.v..>v.vv.v..v>.>v.....vv..v...>...>....>
>>..>.>>v....v.v...v.v.>>..v.>..>.vv.>..>.>v.vv.v...v..v.....v...>v.........>>..vv...v..v>.vv...vv>..>>.v>.vv....>.v..>>>>...>v..>>>...vvv>
...>..v...>.>>...vv>.v..v>vv....v>v.>.v..v.>v>..v.......>>vv.v>..v>..>.>.>.v.>...>..v.>.vv>..>v.>>>>..>.v.>>.v>v....>...>>v>>..v.v>.v..v>..
>.vv>...v..vv.v.>.>v...v..v.>.>.....v....>..v.>.v..>v.v...vvvvv..vv..>.vv.v>v..>.>>..v....v.v>.vv>v.>v>v>..vvv..vv>.v..>v.v..>..v...>.>>.>.
>vv....v>vv.v...>>.>..>....>.>>....>...v.>.>v..vv............v>v.>.>.v...>..>.>..v.vv>...v..v>.vv...vvv>.>..v>>.>...>>.>..>....>.vv..vv..v.
.>...>vv.....>v.>>vv.v..v>v...v>vv..>.v>vv>v..>..>>...v.>v>vv.>...v.....v.>v>.>>..>>>v....>.>..v.v.v.>..vv.>>v.vv.>>v>vvv>.>.vvvv.>>v>.>v..
...v.v..>.>.>v.>..>v>>.>.>.v..>>>..v>>......v>v....>.>>vvv....v..>>vv...v.>..v...v..v.vv..vv.v>.>>.v...v.vv.>.>..v......v>.>.>..v.>..v.vvv.
...>..v....>..>>>>.vv>v..v>>>>......vv....vvv.>.>v>..>.>>v..v.v>.>v>.>v>.>..v.v...v>..>vv..>....>....>....vvv>.vv...v...v.vv>.>.v..v.v>>>..
..>v>>v.>..>..v..v>....>....v.v>..>...v>vvv>...v>.>......vv.v......vv.>v..vv>.>.v.vvv>>v.v..v.v...vv...v.v.>>v..>>v.v.vv..>>.v>.>.vvv>.v.>.
.>.v>>.v.vvv>v>v>v....vv.v.vv>vvv>.v...>>v>.v..>v.>>....>.>>..>>...>....v>.v.vvvv>.....v>.>>.v....>.v....vvv>>v..v>v..v>..>.>>.>...v>.>..>.
vv.v......>v....v>vv.....v..v.v>.>.>v...>.vv.>vv>v>vvvv>.vv.v.v>..v..v>.v.>.>v.>..v..>....>.>...vv>>>.>>...>>>.vv.....>>>.>v.v..vv>..v.>...
v.>..v.>.>>.v..>.....>v.v.>>..>..v..>...v>.v.v.v>.vv..>.v.>....>.>>v....v>v>.v.>v.v>...>..vv..>.v>>v..vv.>v>.v>>..>.v>v.>......vv....v.v>v.
v>.....vv.>v..>>>vv..v...v>vv.v>..>..>...>...v>..v>v>..v.vv.>v>..v..v.>.....vvv..v.v.>.>.>..vv....>..vv..>..v.>vv...vv>...v>>.v>..>v.>>v>..
.....>.>>>....v.>...>.>.v...v....>..>v...v..>.vv.v.....vv.vv>v>vvvv.v..v...v.v>..vvv>v>..v>..>...>......v.>.>.....>...vv>....v.>.v.>v....vv
.v>..>..v.>...vv>v..>...vv.v.v...>....v.....>>>vv...v.>v>..>.>>..vv>v...v>>>>vvv.v>.v..>..>.>>>vvv...v.vv.........>.>>...>..>v>.>.v.....v..
....>>v......vv...v>.>.v..>....v.>...>.v>>>>.>>>>...v>v>..>v...>....v>vv.vv..>>.v....v>..v.>.....vvvv.>v>..>>..>.>>....v.>.>>v>..>>>v...>.>
v>>..>.>>>.v>>..v.v.>.>...v>.v.....v.vv>v.v.>..>.....>.....v.v>>v>>v.v..vv...>>v.v>.v.>.>.v...>......v...>>v.>.>..v...>>.>.v.>v.......v>.>.
>>.v..v.>>.>v.>.>....v..>vv>......>...v>...v>..>..v.>>v.>..vvv.v.....>..vv.v......>v...v.v>..v...>>..>.>.....>...vv.v>.>>.>.>......v.>...v.
..>..vvv>v.vv>>.v...>>.v>>>v.v>.v..>..>v>>.>v>..>>.v.>>>v.....v.>.vv..vv...>>v.>vv>vv.vv.v....>...v..........v.>>v>>>.v...>>>v..>.......v>.
.>......v.v.>>vv..vv.>....v>vv.>...>.v.>.....v.>.....v>.>v..>vv..vv>..v..v.>v>.>v.v>vv.v>..>.>.....>.>.>>.>.>..>.>..>.vvv>..>>v.>v...>..v..
.v..v...v>..>.v>.v>>>.>>>.>....vvv>v.>vv.>v.>.v.>>..v>v..vv>v>..v.>v...v>.>..>.v>.>.>.>>vvv..>......v.v.v>..>>.v>>..>vv..v>.v........v>>...
..v>.v>vv.v.v>v>.vv..vv...v..vv.vv..v>>.vvv..>v..>>..v.>v....v.v.v>vv..>>>.>>..v.>v.vv.v..v>.v>..>v..>>>v>..>>>.v.>v>.>.vvvv...v.v....v>.v>
vv..v..v.>.v.....v.>.>v..v>...v>.v....>v.v..>v.>>vv>>vv..>.v...vv.>..>>.>..>>>.v.>.>.v>v>.>.>v.>vvv...v..>....>>.>v>..>v.>>........v.>.vv>.
..v.>vv.>>..>>....>...vvv...v.>...vvv..>v....>>...>v.>vvvvv>v.vvv.vv>..v>vv.v>v..>>>>.v..>>>.>.v>v.>.>>>.vvvv>>>..vv....>.v.v.>.>v.v.>...>.
v..v.......v>>v.vv...>>v.v>v>..v>.v>>.v..>.vv..v>v..v>.>.vv.>>vv.v.>.v.v..v..>v..v..>v....v.v..>v>...v.>.>..>>>v...v>v>....v..>.>.>>v.>.>.>
......vv>v..>>.......>>vvvvvvvv.v.>>>.>v..v.vv....>..>.>.>.>.v>>....>>.v..>.v>v>v.vv>>v....>>>.vv>.>.vvv>>....>....>>.vv>.v.>.>...v.v>>>v..
.v>.vv>..>.v>>..>v>>..>...v.v.v.>>v>v..v...>.>>>.>.>..vv..v..vv>>v.>vv>>v.>>...v......>>>..>v.vv..>.>....>...v>.v>.....>.>v>>..v>......v.>.
.v>>.v.>>..v....v...v.v>>.>...v..>>.>>.>>>v.v.v>.....v>....>.v>v.>...>v..>..>...vv..v.v..v...v.>....>.v.>..>>v>v....v..>.>.v>>v.v>...v.>..v
.>.v>v..>v.v..>>...v...v>v..vvv>....v.v....>>..>v>>...v.v.v...vv...v..v.......>.v.v..v...vv.>>>>.>>v...v..>..>.>...>>.vv..>..v.>>vv>>v..>.v
vv.>v...>.vvv>....vvv..>...v....v.v..>>v...>>...>..v.v..vv>v...v.>.....vv>v.vvv>.vv>.vv>v.v..>.>....>.....>v>v...v...>>.>...v...vvvv>.....v
vv>.....v.v...>.....vv..>...>>vvv>.v.v>vv.>>.>.v>..v.v.>v.v...v>..>.>..>..vv.>v..v.v..>.vvv.>v.vv>..vv..>..v....>>vv>v....>..v..vv..>...v>>
......>.>>>>...>>.v>>v>..v>>.>......v.>.>.v..v.v>...>....v>...v>>v>.v>..v.....v.>..>.v>.vv.vv..vv...v.>....>.v...>>v.>v.vv.>>.>>.>v>v......
..v>...v..vv>..>....>v.>...>>v.v.>v.vv>...>.....v...vv.>.v>v>vv>.v..vv..vvvvvv.vv.>vv>vv>vv>v>.v...>>v..>>....>v...>v..>v>.v>....v>vv>>.v>.
>v.>>v.>.>>vvvv.v>>.>>....v...>.>.>>>vvv>v>..>>...>v>>>...v>.>v.v...>>.>v.>>.>.v.v>.>vv>>>.v>.>.>v.v...>v.>.v.>..v..vvvv>>.v..>v>.v.....>v>
.>>.>v..v>...>..>>.>>>>...v>>.v.v>>v.>>v>>.v.>.>..v..>...vv..>vvv>v.v.>.v..>>..>v>.vv.vv>>v>v>>..>v>>>.>...>.v>.>..vv>.>v>.v..>>.v>......v>
>..>>>>v>vv.vv>.>>>....>.v.>>>..v>.vv....vv>v..>.>.>v>.vv>..>>.v.v.>>>>>>>v....>vvv.>.v>v>>vv.>.>>....v>..v.v.>..v.vv>.>>vv..v.>..>.>v>....
.....v.>>>.>.>.>>>>>>.>v..v......>.>v>v>>>.vvv>.vvv>.>v>>..>>.v.>.>...v..v>>..v.>...vv..v>..>v.....v.>>.>.vvv...vv>.v>>>>...>..v.>v.>>v.>>>
v.>v..>>.v......vv.>.vv....v.v...v>.>>..v..>v..>........v.vv>v.v>vv.vv>.v>v.v....vv>v....>v...>>..v..v>.>vv...v>...>.>..v..>..>.>..vv>.v..v
>..>.>v.>>v..>>vv>v.>....>..>.v>>....v.v...v.v.>...>.>.>.>v>>v>v>v..v.vv...vvv..v>..vv>.....>..v.>vv>...>>>v.>>>..>.>..>v..v..vv>....>.>.v>
.>vvv>.....>.vv..v..>..v....v>>..vv..>.v..>>v>>v.>.vv..v.>v>vvvvvvv......v.v.v>.>....>vv...>>>>.>>.>..>>v.v>vv....vv..v.>v.vv>>..v...v>v..v
.>..v..>v......>...vvv..>>.>.>.>.vv...>>.>..v..v.v>..vv>..>.>v....>....>v...>>.>vvvvv>..v.vv>.v....v>.>v.>.>..v.>v>.>>..v>.v>v..>...>.>.>..
v.v>>v>..vvv.>.v>.v.>.>.v..v..>>.>vv>...>>v...>..vv..v.>>.v.>.>.v.vv>>vv>.>>>>..>....>>.v>>vv>>>v.>.......>...vv>>>...>>v.>>.v.v.vv.>.v.v.>
>.v>v...vvv.>vv.>vvvv.>v.>vv.v......v.v..vv.>>>>.>......v....v.>.v.v.v.v>v.>..>v..>.v.v..>v.v>.>v.v.v.vv>v..v>>>...........>.>v.v....v..v..
.v>..v>......>v>.>vvv..v>.v.>>>v..>....v..>.>vv>v>v..v>.v.v..v>>v.v>...>>...vv.>.>.>>.>>>>.....>.>>>>>.>...>v>v>.v>..>>>>.>>.v.v..vvv>.>.v.
...vvv..v.v>vv.v.v.>>vvv.>v.>>...vv>.>v>...v>..v.>>>>...v..>.vv..>.>vv.....>.>v>.v..v.v....>...>...>v>..>v>>.vv.v.>..v.....>.vv..>.vv>v.>..
>v..>..vv....>v>.>>.>.v.v.v.>v.v...>v....>>>..vv.>>..v....>.v...>.>v>vvv...v....v.v>...vv>>....>v..v.>>>>.v..v>>.vvv..>..v.vv>v..>.v.>..>.v
..v.>.vv>>..>...>.v..>.>>v>v.v....>.v...v...>>.v.v>..v.....v...v.v.v>....vv.v...>.>........v...vvv>>.v>>..v...v.vv>..v..v.>.....v>...>>vv..
...>.....>v>.vv>v>.>>.>.v>>>>v>>v>>.>>v..v..>..v...>>vvv.v.>v.v>v>vv.>>>.v...>v.v>v.>.>>v>>vv.v>.v>>vv..vv.v>.v>>...v..>v...>v>v>..v>...v..
.>v..>...v>vvv>..>.vvvv..v..vv..vv.>v.>.v.v......v.....>v.v...v.>>>.v..v.>...>.>..>>v.....v>...v.v..vv>....v.v..v>..v>.....v>.v>..v>>v....v
v.vvv>vv>.vvv.....>...vv..v..v>..>v.v..>..v...v.v.>>.vv.>v.>..>.>.v.v>.....>>>v.v...>.....>>.>.>v>>>....v.v>>>v.v.v.>.>v>...v....>.v.v.v..>
.v...v.v>..v>v..>..>.vv>vv.>vvv.v..v....v>>..v>...>v>>....v.>..vv..>.......v.v>>.>..v.v...vvv..v......vv.....v>.v........>vv.>.>.>>vv.....>
.v.v.>v..>....>>...v.>..>..>.>.>v..v>>...v.v.>..vv.v..v.....vv....>>..v>>>v.>.....v.....vv...v>v.>....>.vv.v.v..v.>v>>..>.vv>.v>..>v.v.v..v
......vv..>.vvv..v..>.vvvv.v>...>.......>.v>>>..>..........v..>vv...>..v.>v.vv.>v..v.v...>>>.>.>>..>.>...>.>v>>v.>...v.v.v>.....>>..v.>>.>>
..v..>>>>....>.>v>>>.v...>v>>>>v>>.>>v..v.>....vv.v.>.v.>>...>.v>..v..v....>>....vv......>.v..>>>vvv.>v.>>vvv>>.v>v>.v.>......v>>.v>vv.>v.>
.>>.v...vv..........v..>....>...v.vv.>>v...>vvv...v.v.>v.....v.v..>>.>>v>..v>>v...v>.>.>>v.v..>.>.>v..v.>v.v>...vv>v...v.vv>.v.v.v>v>>..>>.
v......>..vvv.v..>>vv>.>>v.v>>>...vv.>..>.v>vvv.>...>.>.>..v.>>vv.v.vvv...>v....v.>v..v>vv.vv.>.v..v>....v.vv>v>>>.vv..vv....>v.vvv>.>.v...
>.v.>>>v>>>>v>...v.vv>.>vv..............vv..>>...vv.>..v...v>>.>v..v....>>>vv.v.>>>>..v.v.>>.>>>vv...v>.>>>v.vvv.v..>.vv.>v.vv>v...>.vvv..v
.>.>.>......>.v>>..vv.>..>>v...vv.>..>vvv..>..v.>..v.....>....v..vv.v.v>vv>.v.v..v..vv>.>>v........v.v>v.>v>>...>v.>>>v..vv..v>>..vv...>>>.
.vv.v>vv..>>v.v.v>..v...>.>.vv.v...v.>.v..v>....vv.....v>>.v.vv>..v.>....>.v..>....vv>>>.>v.v>.v>v...>>>v>.>>.v>>vv...>.>>...>vv...>>...>v.
..>v.v>>.....vv..v>vv.>vv.>..>..v>.>vv>..v.>v.>.>v.>.>vv>...vv.>>>>>vv.v>..>..>>>..>>v.>>v.>>.vv.>>vvvv>>v>>.v>..v>v>>...v>...v..>...>.>vv.
vv>v.>.>.>v.v....vv..>..>.v>vv..>v......v......>vvvv>.....v>v.>..>v..v.>>v.>>v.>v>v>.vv..>>..>.>v..>v>.v>.>>>.v>.vv>.v>vv.v.>.vv.>>vv......
.v>.>..>v>.v>.>vv....vv.vvv.....>vv.>v..v.>v.vv........>..vvv>vv>.>..>>..v>..vvv.>..v.>v.>..v.vv>v..v........>..>v.>>>vv.v>.....v.>>.......
.v.>.v..>.v>v.vv.>..>>.vv....v>.vvv...>..v.>..v.>.v..v...>v.>vv>.>.>.>>..>>..v....>>.>vv.>>..v..>.>>v.>>vv.v........v..>.......>v>vv..vv>..
..v..v..v..vv>..>v.>.v..>vv..vv......>.>>>>>....>......>.>>>v>.>v>..v>..vv>.v.v>......v.>..>..>>vv>.....>.>vv.vv...v.>v>>.vv.>.>...vv..v.>.
v..vv.>v.>>..v...v.>..v..v...vv...>.v..v...v..v>v..vvv.v.v.vv.v..>v>..v>...v.v..>.vv.>v.>...vv>.>...v..v.v>...v>..>>>>vv>>...vvv>>.>>.v.>>>
...>v...>......>..>>.v>v.>>..v...vv>>>>.>.vvvv..>..v.>>..>.>v>.>v..v..v>.>v..>.>..>>v>v.v>v.v.v>>v.v.>.v.>>vv..>.v....vv.>....>v.>v.vv.>>>v
>>>>.v.v...vvvvvvv.v>>>v>..v.>v.v...>>..>>v.........>vv.>>...>vv.>>..>..>vv..>...v.>v..>>v.>>>..v.>.v>>.>.v.v.vv...>vv..>..v>>...v......v..
>>...v.>v..>>...>..v..>.>>..>v..>.v..>.vv.>>v.vv..>>v.v..vv.>.>...>..v..v>vv.>.>>..vv.....v>>..v.>.>>>.>v.v...>...v>...vv.>.....v>...v.>...
v.v.....v>>vv.v>v>>...>.vvv>>..>>>>>v.....v>>>>.>>vv>..vv>.>.>..>.v>v.v..v>v>.vv..>>.v.>v>>>......v..>.....v.>.vvvv>v.vvv.v..>>..>..v>v.>vv
..v.v.v.v.v>>..v>...>vv.v.>>>.v.>..>>>.vvv>........>..v>...>>>>...>vv.>..v.>.>v>>v>.>.v..........>..>..>>vvv......v.....>.v...v..v..>.>v.v.
.v>.>v...>v.vv>v..v..v>>.v.vv>.v.>....>..v.>v>.>.v..v..>v>v....>>>v.v>>v.>.....>.v...v...>v..v.vv.>.>.v>.v....>.v...>>vv.v>>vv>...>v.....>v
>..vv..v....>.>v>.>>>vv.>.v>v>>v.....v..v..>vv.>>.....v...>..v..>>.>v>v>>.>>>vv..>..v..v>v...v>.>>.>...v>....>..v.>>.v.>..v>.>v>..v.v.>v..>
.v.v.>.v.vv>>..>.>..v.>..v..v.>..>......v..v>..>>>...vv>.v..v.v.vv.v.v>v>v.v...>vv.v..v.....v.>...v..>>.>.>vvv>.............>.v>>>.>v.>..>>
..>.>>.>vv..vv>...>>vv...>>>.........v>v..>.vv.>.v.v.>v>>..vv.v...vvvv..>>...>.v..>...>..vv.vv.v>.vv>v>.v.>v.v.....>.v>>>>>.>..v>>.....v.>.
v..>..v..v....v>...vvv..>.v....v.>.......vvv..v>>.v.>.v>>.>.vv..v.vv.>v>.>>.>v>v>..v.>.v..v>..>vv.v>..v..v..vv.v>..>>>.vvv...>...>>v>..v.v>
.vvv..v>....>v..>v..>.>>vv>>......v.vv.v>vv..>.v>....v..>.v>v.>.>....vv....v..v.>>.v.>v>.>.>vv..>v.>.v..v.vv..vv.......v>..>..v...v>.>vv...
.v>v>.>.v.vv.v.>.>..>v..>..vv>.>v>v..v>.>>..>..>..>.>.v.v>>.>v.>.v..v>v...>.>...v.v...v>>..>.>.v>.>..>.>..>vv.>..>>.v.>>>>..vv..v>>>.......
>vv...>vv.v...v...>...v...v>v>>>..v>...>...v.>....v.vv...>.v>...v..>>vv.>.>...>>v.....>v..>.v>v>.v......>....v.v..>v>.>.v>v.vvvvv.v>>v.>>>.
.>>>.>..>....v.>.>..v....>>.>....>.....vvv.v>.v>..>..vv..>vvv.>v.>.v>>.>v>v>..v......v>v>>>.>.....>.>........v...>>.v..>>v..vv..>.v.vv.vvv.
vv...vvv>...>v.v>..>v>v>.....v....>v>.>..v>>>vvv....>>...>.v.>.>v...v>v>>vv....v.>..>>.vv.v.>>v.......v>vv..v..v.v>...v....>..>..v>.>.>..v.
.>..v>.v..vvv.>.v...v>.>....vvvv..>..>>>>.v....vv.>>...v.v>vv..>..v>...>....v>..v>..v>...>.v>.>.v.v.v.>v.v>v>>>vv>.v>>vv.v>v>>v>..v.>...>.v
>v>>.v......>vv>v..>>.>....vv..v>.vv.>.>..v......>>>>>...v>>.v>v.....>.v..vvv.>>v>>v.>..v...>.vv.>v>..v.vv>vv...>.v...>.>..>.>>v.>.........
.>......>.>.>>..>.v.>..v.v>...>..v.v>.>..vv.>....>........>>..>v>>..vv.>.>vv.>v...>>.>>..v>..>>....v.>.>>.vv.>.>v....>.>v..v....v...>>.>>.v
v..v.>.>...v...>v.....>.>...v.>.>....>v..v>v>.......>.v.v>vv.v>>.v.......v...>>>.>.>>.v>>v..>v.vvv...v.v.....v.v>.vv.v>.......vv...v>....vv
>..>.>v>v.....v>.>>v....>........>>..>vvv>vv>.....>vv..>.>>.v>.v..>vv.>...v..vv.v.>.v.>>v..v.>.>.v>.v>.......>>..>..>.v>v....>vv..>>v>v.>.>
...v>>v>>v>v.>>v.v.>>..>vv>....v>v.v.vv>vv>..>.>>v>>..v.>>>v.........v>.>......>.>...vv>v.v..v>.v.>v.>>v>v>.>>.v..v.v>..v..v>>.vv....>..vv.
.>.v...v...v..>>v.>...>>v.>.>v....vv>...>....>.>>...vvvv>v>..v.>.v.v......v>>...>...vvv>.v>.>v..v>v.>.v>.v>...v.>.....>vv.>...v.>..>>..>...
.>.v..vv>>v.v...v.v..>.>...>v>>>.vv>>...v.v...>v.>>>>.>.v....v..>..v>v..>>.>.>v...vv>v>v.....>...>...>>>...v>v..v..v..>.>.v..>...vv>..v>.v.
>vv.v.>v....>>.>.....v..>.>v>>>.>>.v>..v....>v>.v>..>vv.v..v..>..v.....>..v.....>...>......vvv......>..v>v..vv>.>v...vv.v....vvv.>v.v.v...>
.v.vv....v>..>..>>.v.>..vv..v>..>..vv.v>v>.>.>...>..>...>......v....>.....>....vv>..v>..v.vv.>..>..>..>.>v>v..>.>>..>>.v>>v>.>..vv..>...>v>
vv.>>v.v>>.>v.>>.>..v.....>v.v.v>vv...>v>vv..vv>>....vv.>>vvv.>.>vv...v...v.v.v..>.>...v...v>.....vv..vv.>vvv.v..>..>>..v>.>..vvv.....v.>..
...>.v...v>.>..>>>v..>.>.......v..v.......vv..v......v>...>..>v.vv...>>...v.v.>v...vv>>..v....v..v>..>.>...v.>>..v>..>..v...v.>..v..>>..>v.
.v..>.....>>v.>>v..v...vv>v.v>.>>..>.>.v>...v>.>..vv..>....vv.......>v>v...>>.>.vv.>vv....v..>v>.>.v>.>............vv>.vv>v...>.v..v>.>v>.v
.>.....>....>.vvvv.v..>....v>.>v...v..>>>...vvv>v>v>...>.v....>.v...>v.vv>v.v...v.v>>...vv.v.vvv>>...>.>vvv...vv....>...v>.vv>v.v.v...>v..v
..>.>>>......>v>.......>>>.>>.vv..v..vv...v>>...>>>.>....v>>.>...>.>v>>>v>..>.vv..>v.>..>>..>.vv.>.....>.......v..>vv......vv...v.v.>v.>v..
.vv...vv.v..>.v.>..v.>..>>....>.vvvv.>>.>....v.v>>.>>v.>v.>..>>>>v>>.>.v.....>.>.......>.v..v.......v..vv>v......>..v.v.>.>>.>.vvvvv..>>...
v.>...>vv>.vv...>>..v..vv.....>vv.v..>>>.v>vv>...vv>..v.>.>..vv..>vv.vvv>.>...>.....vv>..>.v>.>v..>.v>..>...>vv.v...>>v...>...v.vv..vvvv>v.
v>..vv..>v>>..vv.>>.>.>vv..v.v..v.v>.>>.....v....>.v.>..>v.vvv......vv>vv>v>.>.v.vvvv>>>>>v>...v>.>.....v....>....>.......v..>.v....>.....v
"""

struct Point: Equatable, Hashable {
    let x, y: Int
}

enum CucumberType {
    case east
    case south
}

var width = 0
var height = 0
func parse(input: String) -> [Point:CucumberType] {
    var result: [Point:CucumberType] = [:]
    let lines = input.components(separatedBy: "\n")
    height = lines.count
    width = lines[0].count
    for (y, line) in lines.enumerated() {
        for (x, char) in line.enumerated() {
            switch char {
                case ">":
                    result[Point(x: x, y: y)] = .east
                case "v":
                    result[Point(x: x, y: y)] = .south
                default:
                    break
            }
        }
    }
    return result
}

let sample1 = """
...>>>>>...
"""

func step(_ map: [Point:CucumberType]) -> [Point:CucumberType] {
    let array = map
        .map { pair -> (Point, CucumberType) in
            let position = pair.key
            let nextX = (position.x + 1) % width
            guard pair.value == .east else {
                return pair
            }
            if map[Point(x: nextX, y: position.y)] == nil {
                return (Point(x: nextX, y: position.y), .east)
            } else {
                return pair
            }
        }
    let eastMap = Dictionary<Point, CucumberType>(
        uniqueKeysWithValues: array
    )
    let southMap = Dictionary<Point, CucumberType>(
        uniqueKeysWithValues: eastMap
            .map { pair in
                let position = pair.key
                let nextY = (position.y + 1) % height
                guard pair.value == .south else {
                    return pair
                }
                if eastMap[Point(x: position.x, y: nextY)] == nil {
                    return (Point(x: position.x, y: nextY), .south)
                } else {
                    return pair
                }
            }
    )
    return southMap
}

func display(map: [Point:CucumberType]) {
    for y in 0..<height {
        for x in 0..<width {
            switch map[Point(x: x, y: y)] {
                case .east:
                    print(">", terminator: "")
                case .south:
                    print("v", terminator: "")
                default:
                    print(".", terminator: "")
            }
        }
        print()
    }
}

var done = false
var map = parse(input: data)
var count = 0
display(map: map)
while (!done) {
    count += 1
    let nextMap = step(map)
    print("Step \(count)")
//    display(map: nextMap)
    done = nextMap == map
    map = nextMap
}

print(count)
