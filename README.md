##GroestlCoinArmory

**Created by Alan Reiner on 13 July, 2011**

**Patched for GroestlCoin by GroestlCoin developers 2015**

[ Groestlcoin Armory](https://github.com/GroestlCoin/GroestlcoinArmory) is a full-featured GroestlCoin client, offering a dozen innovative features not found in any other client software! Manage multiple wallets (deterministic and watching-only), print paper backups that work forever, import or sweep private keys, and keep your savings in a computer that never touches the internet, while still being able to manage incoming payments, and create outgoing payments with the help of a USB key.

Multi-signature transactions are accommodated under-the-hood about 80%, and will be completed and integrated into the UI soon.

** Groestlcoin Armory has no independent networking components built in.** Instead, it relies on the Groestlcoin Core to securely connect to peers, validate blockchain data, and broadcast transactions for us. Although it was initially planned to cut the umbilical cord to the Groestlcoin Core and implement independent networking, it has turned out to be an inconvenience worth having. Reimplementing all the networking code would be fraught with bugs, security holes, and possible blockchain forking.  The reliance on Groestlcoin-Qt right now is actually making Armory more secure!

##Building Groestlcoin Armory From Source

In Ubuntu, open a terminal (Applications → Accessories → Terminal) and copy in each of the following lines one at a time :

sudo apt-get install git-core build-essential pyqt4-dev-tools swig libqtcore4 libqt4-dev python-qt4 python-dev python-twisted python-psutil

git clone git://github.com/GroestlCoin/GroestlcoinArmory.git

cd GroestlcoinArmory

make

python ArmoryQt.py

Alternatively you can run "sudo make install" after building and it and it will install Armory onto your Ubuntu system, including but shortcuts in your the Applications --> Internet menu.

##Dependencies

* GNU Compiler Collection  
 Linux:   Install package `g++`

* Crypto++  
 Linux:   Install package `libcrypto++-dev`  
 Windows: [Download][Windows Crypto Download]    
  
* SWIG  
 Linux:   Install package `swig`  
 Windows: [Download][Windows SWIG Download]  
 MSVS: Copy swigwin-2.x directory next to cryptopp as `swigwin`  
  
* Python 2.6/2.7  
 Linux:   Install package `python-dev`  
 Windows: [Download][Windows Python Download]  
  
* Python Twisted -- asynchronous networking  
 Linux:   Install package `python-twisted`  
 Windows: [Download][Windows Twisted Download]  
  
* PyQt 4 (for Python 2.X)  
 Linux:   Install packages `libqtcore4`, `libqt4-dev`, `python-qt4`, and `pyqt4-dev-tools`  
 Windows: [Download][Windows QT Download]  
  
* qt4reactor.py -- combined eventloop for PyQt and Twisted  
 All OS:  [Download][QT4 Reactor Download]  

* pywin32  
 Windows Only:  qt4reactor relies on pywin32 (for win32event module). [Download][Windows PyWin Download]  
  
* py2exe  
 (OPTIONAL - if you want to make a standalone executable in Windows)  
 Windows: [Download][Windows Py2Exe Download]  

##Sample Code

Groestlcoin Armory contains over 25,000 lines of code, between the C++ and python libraries.  This can be very confusing for someone unfamiliar with the code (you).  Below I have attempted to illustrate the CONOPS (concept of operations) that the library was designed for, so you know how to use it in your own development activities.  There is a TON of sample code in the following:

* C++ -   [BlockUtilsTest.cpp](cppForSwig/BlockUtilsTest.cpp)
* Python -   [Unit Tests](pytest/), [sample_armory_code.py](extras/sample_armory_code.py)


##License

Distributed under the GNU Affero General Public License (AGPL v3)  
See [LICENSE file](LICENSE) or [here][License]

##Copyright

Copyright (C) 2011-2015, Armory Technologies, Inc.

Copyright (C) 2015, Groestlcoin

[Windows Crypto Download]: http://www.cryptopp.com/#download
[Windows SWIG Download]: http://www.swig.org/download.html
[Windows Python Download]: http://www.python.org/getit/
[Windows Twisted Download]: http://twistedmatrix.com/trac/wiki/Downloads
[Windows QT Download]: http://www.riverbankcomputing.co.uk/software/pyqt/download
[QT4 Reactor Download]: https://launchpad.net/qt4reactor
[Windows PyWin Download]: http://sourceforge.net/projects/pywin32/files/pywin32/
[Windows Py2Exe Download]:  http://www.py2exe.org/
[License]: http://www.gnu.org/licenses/agpl.html
