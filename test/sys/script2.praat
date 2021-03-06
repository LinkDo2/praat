writeFile ("kanweg.txt", "hello")
appendFileLine ("kanweg.txt", " é", 3, "oeps")
appendFile ("kanweg.txt", "갡갳")

writeFileLine ("kanweg2.txt", "hello2")
text$ = readFile$ ("kanweg2.txt")
assert text$ = "hello2" + newline$

writeFileLine ("kanweg2.txt", sqrt (100))
number = readFile ("kanweg2.txt")
assert number = 10

writeInfoLine (2, "hallo", 3)
assert info$ ( ) = "2hallo3" + newline$
assert number (info$ ()) = 2

writeInfoLine (undefined)
assert number (info$ ()) = undefined

do ("Erase all")
writeInfoLine ("Test...")
p = do ("Create Sound as pure tone...", "a", 1, 0, 0.4, 44100, 440, 0.2, 0.01, 0.01)
do ("Play")
do ("Save as WAV file...", "kanweg.wav")
beep = do ("Read from file...", "kanweg.wav")
do ("Play")
do ("View & Edit")
editor Sound kanweg
	do ("Zoom...", 0.1, 0.3)
	do ("Play or stop")
	Zoom... 0.1 0.3
	Play or stop
endeditor

q = do ("Create Sound from tone complex...", "sweep", 0, 1, 44100, "Cosine", 100, 0, 0, 0)
do ("Play")
r = do ("Create Sound from formula...", "fff", "Mono", 0, - do ("Get value at sample number...", 1, 2), exp(10), "do (""Get value at sample number..."", 1, 1) * sin (2*pi*400*x) * sin (2*pi*400*x) * sin (2*pi*400*x) * sin (2*pi*400*x) * sin (2*pi*400*x) * sin (2*pi*400*x) * sin (2*pi*400*x) * sin (2*pi*400*x) * sin (2*pi*400*x) * sin (2*pi*400*x)")
a = do ("Play") and do ("Play") and do ("Play") and do ("Play") and do ("Play") and do ("Play")
do ("Draw...", 0, 0, 0, 0, "yes", "Curve")

select q
numberOfSamples = do ("Get number of samples")

stopwatch
for i to numberOfSamples
	a = Get value at sample number... 1 i
endfor
time = stopwatch
appendInfoLine ("first method: ", fixed$ (time, 6))

stopwatch
for i to numberOfSamples
	a = do ("Get value at sample number...", 1, i)
endfor
time = stopwatch
appendInfoLine ("second method: ", time)

stopwatch
for i to numberOfSamples
	a = Get value at sample number: 1, i
endfor
time = stopwatch
appendInfoLine ("third method: ", time)

Formula: ~ col
a = do("Get value at sample number...", 10 + sin (0))
b = do("Get value at sample number...", 100 + sin (0)) + 5
c = 20 + do("Get value at sample number...", 1000 + sin (0)) + 50
appendInfoLine: a, " ", b, " ", c

a = do ("Play")
spectrum = do ("To Spectrum...", "yes")
appendInfoLine (a, " ", q, " ", spectrum, " ", r, " samples=", numberOfSamples, " ", beep)

demoShow()

removeObject: p, beep, q, r, spectrum