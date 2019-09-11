BEGIN{tcpRec=0;tcpDrop=0;ackRec=0;ackDrop=0;udpRec=0;udpDrop=0}
{
	if ($1 == "r" && $5 == "tcp")
	{
		tcpRec++;
	}
	else if ($1 == "d" && $5 == "tcp")
	{
		tcpDrop++
	}

	if ($1 == "r" && $5 == "cbr")
	{
		udpRec++;
	}
	else if ($1 == "d" && $5 == "cbr")
	{
		udpDrop++
	}

	
	if ($1 == "r" && $5 == "ack")
	{
		ackRec++;
	}
	else if ($1 == "d" && $5 == "ack")
	{
		ackDrop++;
	}
}
END{
	printf("TCP Received: %d\n", tcpRec);
	printf("TCP Dropped: %d\n", tcpDrop);
	printf("UDP Received: %d\n", udpRec);
	printf("UDP Dropped: %d\n", udpDrop);
	printf("ACK Received: %d\n", ackRec);
	printf("ACK Dropped: %d\n", ackDrop);
} 
