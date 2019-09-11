BEGIN{tcpRec=0;tcpDrop=0;ackRec=0;ackDrop=0}
{
	if ($1 == "r" && $5 == "tcp")
	{
		tcpRec++;
	}
	else if ($1 == "d" && $5 == "tcp")
	{
		tcpDrop++
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
	printf("Packets Received: %d\n", tcpRec);
	printf("Packets Dropped: %d\n", tcpDrop);
	printf("ACK Received: %d\n", ackRec);
	printf("ACK Dropped: %d\n", ackDrop);
} 
