#!/usr/bin/perl
use LWP::UserAgent;
use HTTP::Request;
use LWP::Simple;

$sis="$^O";if ($sis eq linux){ $cmd="clear";} else { $cmd="cls"; }
system("$cmd");

if (!$ARGV[0]) {

$sis="$^O";if ($sis eq linux){ $cmd="clear";} else { $cmd="cls"; }
system("$cmd");

my @banner = (0,100..200);
my $variablebanner = $banner[int rand @banner];

if ($variablebanner % 2 == 0) {

&banner1();
exit;

}
else {
&banner2();
exit;
}
}

&banner2();

print q {
[+] Scanning Website - gblPacky...

};

open( SITE, "< $ARGV[0]" ) or die( "Can't Open the file: $!" );

our @array = <SITE>;

$numero = $#array;

for ($i = 0; $i <= $numero; $i++) {

$Dominio = "$array[$i]";

if($Dominio !~ /http:\/\//) { $Domain = "http://$Domain"; }


$cmd = "'";

$site = "$Dominio$cmd";

my $req=HTTP::Request->new(GET=>$site);
my $ua=LWP::UserAgent->new();
$ua->timeout(15);
my $resposta=$ua->request($req);

if($resposta->content =~ /You have an error in your SQL syntax/ ||
$resposta->content =~ /MySQL server version/ ||
$resposta->content =~ /Syntax error converting the nvarchar value/ ||
$resposta->content =~ /Unclosed/ ||
$resposta->content =~ /SQL Server error/ ||
$resposta->content =~ /JET/) {

print "\n \t $Domain \n";

open (NOTEPAD, ">> SqlInjection.txt");
print NOTEPAD "$site\n";
close(NOTEPAD);

}
}

print q {

[+] FIM !
};


sub banner1 {

print q {

::::::::::.   .,-:::::  :::  .  .-:.     ::-.
 `;;;```.;;;,;;;'````'  ;;; .;;,.';;.   ;;;;'
  `]]nnn]]' [[[         [[[[[/'    '[[,[[['  
   $$$""    $$$        _$$$$,        c$$"    
   888o     `88bo,__,o,"888"88o,   ,8P"`     
   YMMMb      "YUMMMMMP"MMM "MMP" mM"           
                                              
 .::::::.   .,-:::::   :::.   :::.    :::.
;;;`    ` ,;;;'````'   ;;`;;  `;;;;,  `;;;
'[==/[[[[,[[[         ,[[ '[[,  [[[[[. '[[
  '''    $$$$        c$$$cc$$$c $$$ "Y$c$$
 88b    dP`88bo,__,o, 888   888,888    Y88
  "YMmMY"   "YUMMMMMP"YMM   ""` MMM     YM 

 [-] Gabriel Packy - sCanner sqli [-]  
                                                                           



[==] use: perl pckyscan.pl sqlin.txt

[++] Scanner: Root Acces []'s

};


}

sub banner2 {

print q {
::::::::::.   .,-:::::  :::  .  .-:.     ::-.
 `;;;```.;;;,;;;'````'  ;;; .;;,.';;.   ;;;;'
  `]]nnn]]' [[[         [[[[[/'    '[[,[[['  
   $$$""    $$$        _$$$$,        c$$"    
   888o     `88bo,__,o,"888"88o,   ,8P"`     
   YMMMb      "YUMMMMMP"MMM "MMP" mM"           
                                              
 .::::::.   .,-:::::   :::.   :::.    :::.
;;;`    ` ,;;;'````'   ;;`;;  `;;;;,  `;;;
'[==/[[[[,[[[         ,[[ '[[,  [[[[[. '[[
  '''    $$$$        c$$$cc$$$c $$$ "Y$c$$
 88b    dP`88bo,__,o, 888   888,888    Y88
  "YMmMY"   "YUMMMMMP"YMM   ""` MMM     YM 

 [-] Gabriel Packy - sCanner sqli [-]   
                                                                           

[==] use: perl pckyscan.pl sqlin.txt

[++] Scanner: Root Acces []'s
};

} 