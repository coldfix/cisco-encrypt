cisco-encrypt
=============

Password obfuscator for passwords to be stored in VPNC config files, such as
``/etc/vpnc/default.conf``.

**IMPORTANT:** Using an obfuscated password does not protect your password if
someone gets access to your config file!

Obfuscation's only purpose is to make it harder to guess your password by just
taking a superficial glance at your config file.


Build
~~~~~

The only dependency other than gcc are the ``libgcrypt`` development files,
which e.g. on ubuntu can be installed as::

    apt install libgcrypt20-dev

Build with gcc::

    gcc -o cisco-encrypt cisco-encrypt.c -lgcrypt

or simply type::

    make


Usage
~~~~~

Call the utility with your credentials::

    $ ./cisco-encrypt mygroupsecret
    7F407242A6A26402FFAB80AE33EFB61988873B7DA8C930FE599AC158E5CE9B50653D081216BFFB587C38C29E02684BF5039E80D9807CC1D6

    $ ./cisco-encrypt myusersecret
    3822F82D77C7CD8B6B617B54B13183C00A1E4B998D66E3BDA25182A1C1D331EF99B22FCC57C4248688D5926A29FE18D21819FB55E2E35EEF

and use its output instead of the plaintext password in your config file with
an ``obfuscated`` statement, e.g.:

.. code-block:: conf

    # group secret:
    IPSec obfuscated secret 7F407242A6A26402FFAB80AE33EFB61988873B7DA8C930FE599AC158E5CE9B50653D081216BFFB587C38C29E02684BF5039E80D9807CC1D6

    # user password:
    Xauth obfuscated password 3822F82D77C7CD8B6B617B54B13183C00A1E4B998D66E3BDA25182A1C1D331EF99B22FCC57C4248688D5926A29FE18D21819FB55E2E35EEF

rather than::

    IPSec secret mygroupsecret
    Xauth password myusersecret


You can verify the passwords using ``cisco-decrypt``::

    $ cisco-decrypt 7F407242A6A26402FFAB80AE33EFB61988873B7DA8C930FE599AC158E5CE9B50653D081216BFFB587C38C29E02684BF5039E80D9807CC1D6
    mygroupsecret

    $ cisco-decrypt 3822F82D77C7CD8B6B617B54B13183C00A1E4B998D66E3BDA25182A1C1D331EF99B22FCC57C4248688D5926A29FE18D21819FB55E2E35EEF
    myusersecret

**Beware that everyone can do this!**
