<?php
$size=4;
for($i=1;$i<=$size;$i++)
{
	for($j=1;$j<=$size-1;$j++)
	{
		echo "&nbsp;";
	}
	for($k=1;$k<=$i;$k++)
	{
		echo "*&nbsp;";
	}
	echo "<br/>";
}
?>