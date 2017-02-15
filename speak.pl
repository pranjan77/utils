#brew install espeak
#brew install ffmpeg
#espeak -m -f myfile --stdout | ffmpeg -i - -ar 44100 -ac 2 -ab 192k -f mp3 final.mp3
#cat final.mp3 final1.mp3 > out.mp3



use strict;
my ($in,$out, $upload) = @ARGV;
if ($in !~/ssml/i){
 die ("perl speak.pl in.ssml  out.mp3 1 (0 for no upload)");
}
if ($out !~/mp3/i){
 die ("perl speak.pl in.ssml out.mp3 1 (0 for no upload)");
}
if (!$upload){
 die ("perl speak.pl in.ssml out.mp3 1 (0 for no upload)");
}



my $cmd = `espeak -m -f $in --stdout | ffmpeg -i - -ar 44100 -ac 2 -ab 192k -f mp3 $out`;
if ($upload == 1 ){
my $cmd2 = `curl -F files[]=@./$out http://priyas-iphone.local/upload.json`;
}
