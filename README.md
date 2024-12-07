<h1>Installation</h1>
<p>Your OS shouldn't matter as long as you have an unix OS and POSIX Shell with the required packages.
Run the Installation script;</p>
<code>chmod +x porterinstall.sh</code>
<p>then</p>
<code>./porterinstall.sh</code>
<p></p>Finally add the script to your .bashrc or .zshrc whatever shell you use. (I  use .zshrc)</p>
<code>echo  export PATH=$PATH:/home/bradix/.porter/ >> .zshrc`</code>
<p>And then you're basically done</p>

<h1>Why Did I make this?</h1>
<p>I was bored and wanted to install testnav for some reason but it only had Debian and Fedora Builds.
So I extracted it and noticed I could just copy the folders, but depencies wouldn't work so this script might be janky.
But yeah Its because I didn't know what else to do.</p>
