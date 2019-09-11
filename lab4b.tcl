set ns [new Simulator]
set nf [open lab4b.nam w]
set nt [open lab4b.tr w]

$ns color 1 blue
$ns namtrace-all $nf
$ns trace-all $nt

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]

$ns duplex-link $n0 $n1 5Mb 8ms DropTail
$ns duplex-link $n2 $n1 5Mb 8ms DropTail

$ns queue-limit $n0 $n1 3 
$ns queue-limit $n2 $n1 3


$n0 color yellow
$n2 color orange

set tcp1 [new Agent/TCP]
$ns attach-agent $n0 $tcp1

set tcp2 [new Agent/TCP]
$ns attach-agent $n2 $tcp2

set sink1 [new Agent/TCPSink]
$ns attach-agent $n1 $sink1

set sink2 [new Agent/TCPSink]
$ns attach-agent $n1 $sink2

$ns connect $tcp1 $sink1
$ns connect $tcp2 $sink2

set ftp1 [new Application/FTP]
$ftp1 attach-agent $tcp1

set ftp2 [new Application/FTP]
$ftp2 attach-agent $tcp2

$tcp1 set fid_ 1
$tcp2 set fid_ 2

proc finish {} {
	global ns nf nt
	$ns flush-trace
	close $nf
	close $nt
	exit 0
}

$ns at 0.1ms "$ftp1 start"
$ns at 0.1ms "$ftp2 start"
$ns at 4ms "finish"
$ns run 
