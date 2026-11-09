Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238772;
	b=g+smiYdiRVl9wjyc4JU6ywv5nwTkIkpKWUQin1AA5HsCA2SGilO++igJRWhgspfkWdOH
	 FvoEqHy+0Ax0NESdu96FtFZuNxULF1NeemPnaGDqPUvQJpYIYBLjA+Fgiub3bJ4LfgHQx
	 X/XNLKN7WQ9521Uy+QDl7KWPiEkDIjesBMP9T4A/ojIww7bkfdYCfeMCT8xdV/xhJKPID
	 zJrbG3coe8Hb+15AiZ53NVYcGSkvPQThzc1YN6pg05WYRfFGBSMulk3jR88dk/PMC/hoV
	 ALUHNheLA6X0UZAb4bIOo6SiX7J59MGakIBc3pP19xR/vxifbpTdYqBk4bmDMkxAbfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=lrLc3lkYrUJycWd399Tn5pH37nGbYEow80QkRWndgQU=;
	b=rcHQAnKEygFlvgNqmyqzloeEW52fYFDCz8oHcmW9tb8HaXgBLj55/0e6bxPTLmcXQ58j
	 5WJbenT5z/0ozndlCrWRhH2EZJw2XcPxtOIBXPL+RXFaT0Jhowr/RJUenWX1R0FcuZp5N
	 JvuOWZMhqVSFFPvKtovX1pUCf6Tl5spROfOJqnLRT3ddiQXTW1VCZWlwe2nbvIjSI2C/n
	 6XBh5G3d9NpB7XqZQ0Bg3PZtjWA28HyfaLBbcEJXdwgiX5E2bq+ILmAA20QL2CltMlqu/
	 tkKTfwLA5lLUwZ2v8OsIPm2mbsamuuVYPkETEXSl+Sv1MgWPFCmWFV+qZ+2Yga8AWrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=XAfYyMbY;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1600606A31C
	for <printk@lists.linux.dev>; Mon,  9 Nov 2026 15:39:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1600606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=XAfYyMbY
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so6604185e9.0
        for <printk@lists.linux.dev>; Mon, 09 Nov 2026 07:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794238770; x=1794843570; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lrLc3lkYrUJycWd399Tn5pH37nGbYEow80QkRWndgQU=;
        b=XAfYyMbY0Dshc5Z8PqOCEsonYkOS1T/hxGlIgIhQTtR65/r0nbjuV/75YVvNuFp2go
         zXfENKhj3wfBWlE0lkA/KEMbkdjgw38DhruiyAA8uC+8R/Bl6SFM3UsMCD8wifPNxSdE
         x5wdMnFaW7xCRMAxSVD5dH9t4W60PBqha0qkXzy5wEPZ5SsBnDQ45rL73Zd+kqBPzpkr
         keqOHAzHoVlfN3gy49aLI0mUEwbdqkz2zB5JBe85ztIJzkphfnejcX5Glid1kpv9hO3V
         0ZlOcV78T5SMCqNvxuSX4sQJzM+GGx2Q+AquSSAWb/3+jb16JMkVTd/Po8iAjcZ/Qhs1
         k2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238770; x=1794843570;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lrLc3lkYrUJycWd399Tn5pH37nGbYEow80QkRWndgQU=;
        b=x89wOyQDkH+BIEtLRG3ZbezO5UPxsrN4UK9TLlnkpDYlRz0759Pa5xFnfee0FJkaew
         lD009ppNTz2VhkiEv1wV15F4tZ4XcUE3VL5uAeH/cqZiLqg2WfuLWOhK7DNwkbQObOCI
         Gl42c1GkcYYrbJrAyC24QhaXhXIiNYRibUDsC3ApthslZ940fpc937f865cjJlZPIVQp
         kfLrAX7E1jkQ8IdOUbmPWN1fQfqjH5a/pkmyOxVxADkVl7P56UVgzWyKZ3dNTNGcek5I
         NPrz1bdvCUEY1Xvjc9FLCTj7mabUi8sxN2PBS4WHoJWt+25cX9iHrPt0ggF6iky5ZLuf
         OnIQ==
X-Forwarded-Encrypted: i=1; AL+hErFVA41tWdRZXtS27nhwa3cRnrmQ6M9ZrHF72rIdbjfTGUBNqsWMVQQ+ZqlSh9nLCxUKxB50nBQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z9NViCpXS6JUPVwgmNIhfzcV/CYyIthAyVeDPdNU4Q4BSr26+CQ
	UaG9oWdcJh6J1Q7TghfPh+pW1Swl65wD4esLMLDxe8hWenaIaIY9R4POtOTEIUCZw+c=
X-Gm-Gg: AYBFou23Bvdl1Yr5wD8QyIrMx34LCtze59IQJ2ck/+jnvfwen6J25OtJEPqtOkmd8At
	3s/M9gMpx9v8ZuBlxR3PbJuMns33C1xFHZcLGQD9O1vT896LX9Ck8SKzxqiOyWICuRbVzleQfKC
	8Zs3atTHxBFKswvtUoJ6m8nUCSpSUdTugUHMKi3wTuoGSYkgVBy1jjBPd+mRmhoCv6TlcQgXonb
	Mlo2+JpplLfSMMRf1jlLFw3wN9fMIgswmFfrWy/8rNPnA249k5fAp5HqssT7HqnIAi4dNbTojFH
	YAaYdklppG0yszd8darlcnwA2yjPFzQKQFpyBJ1RDG6poVwezsCbckBHwTaTczUUXtmFQvabYzI
	T+DF0/Dg4takz/lPb2RYAfeYORcwrVsKBLDXE3quxoVtLJCyS11kSt4sH51XAlenRVlNgBoDakf
	MWMTQKfAgo7+opTi1PjqeveT/SobTPs3gP8H5Y8esIoocD+7j5NcjV+QsJqfnrFbUQFQ61FS0as
	Dz/VsEI6THJ7QQmbYhXACt0e7HwpEXDPPhYDWAi/aO0xXixJxFTviV66DTiKuSNDUXbh9lU270A
	UQD6yu3McgJ/90lcfBKVykzuvB0CVdH9trcCFowaW6hwPXtHg5c=
X-Received: by 2002:a05:600c:468d:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4b960d9c5d6mr86659245e9.6.1794238769793;
        Mon, 09 Nov 2026 07:39:29 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee247e9sm156321235e9.6.2026.11.09.07.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:39:29 -0800 (PST)
Date: Mon, 9 Nov 2026 16:39:27 +0100
From: Petr Mladek <pmladek@suse.com>
To: sashiko-reviews@lists.linux.dev
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	printk@lists.linux.dev
Subject: Re: [PATCH v6 14/16] printk: Do not set Braille console as
 preferred_console
Message-ID: <avHpL7ojyapVvGlY@pathway.suse.cz>
References: <20261106171952.207909-1-pmladek@suse.com>
 <20261106171952.207909-15-pmladek@suse.com>
 <sashiko-outbox-201949@kernel.org>
 <avHm3aYaDdcif-ss@pathway.suse.cz>
X-Mailing-List: printk@lists.linux.dev
List-Id: <printk.lists.linux.dev>
List-Post: <mailto:printk@lists.linux.dev>
List-Help: <mailto:printk+help@lists.linux.dev>
List-Subscribe: <mailto:printk+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:printk+unsubscribe@lists.linux.dev>
List-Owner: <mailto:printk+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avHm3aYaDdcif-ss@pathway.suse.cz>

On Mon 2026-11-09 16:29:42, Petr Mladek wrote:
> On Fri 2026-11-06 17:36:30, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential
> > issue to consider:
> > - [Medium] printk: inconsistent Braille state in
> >   add_or_update_preferred_console()
> > --
> > 
> > commit 7297fe2fd570a081c485097cb3f11fae0fc8a9d2
> > Author: Petr Mladek <pmladek@suse.com>
> > 
> > printk: Do not set Braille console as preferred_console
> > 
> > This commit replaces the preferred_dev_console index with a linked list of
> > non-Braille preferred consoles so that redefining an entry as a Braille
> > console does not leave preferred_dev_console pointing to a Braille entry.
> > 
> > > diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> > > index 1aad21c082c99..efc695ca9d13c 100644
> > > --- a/kernel/printk/printk.c
> > > +++ b/kernel/printk/printk.c
> > [ ... ]
> > > @@ -2649,10 +2656,20 @@ static int add_or_update_preferred_console(unsigned int i,
> > >  		braille_set_options(pc, brl_options);
> > >  	}
> > >  
> > > -	if (brl_options)
> > > +	if (is_new_entry)
> > > +		INIT_LIST_HEAD(&pc->preferred_dev_node);
> > > +
> > > +	/*
> > > +	 * The last preferred console should get associated with /dev/console.
> > > +	 * Except for the Braille console which can't get associated with
> > > +	 * /dev/console.
> > > +	 */
> > > +	if (brl_options) {
> > >  		want_braille_console = true;
> > > -	else
> > > -		preferred_dev_console = i;
> > > +		list_del_init(&pc->preferred_dev_node);
> > > +	} else if (!is_braille_console_preferred(pc)) {
> > > +		list_move(&pc->preferred_dev_node, &preferred_dev_console);
> > > +	}
> > 
> > [Severity: Medium]
> > When an existing non-Braille entry is updated with brl_options (for
> > example, console=ttyS0 followed by console=brl,ttyS0), does this leave pc
> > in an inconsistent state where preferred_dev_node is removed from
> > preferred_dev_console while pc->brl_options remains NULL?
> > 
> > braille_set_options(pc, brl_options) is only called when is_new_entry is
> > true, so is_braille_console_preferred(pc) still returns false after the
> > update.
> 
> It is a regression since v5 because I removed the questional patch
> for overriding console options, see
> https://lore.kernel.org/all/20260929120546.328616-10-pmladek@suse.com/
> 
> > As a result, __try_enable_preferred_console() skips pc during the
> > Braille pass and instead enables it as a normal console without
> > CON_CONSDEV, and if it was the only preferred console, preferred_dev_console
> > becomes empty and try_enable_console() also falls back to
> > try_enable_default_console().
> 
> Note that the same problem existing even in the original code (before
> this patchset). The original __add_preferred_console() did:
> 
> 	/*
> 	 *	See if this tty is not yet registered, and
> 	 *	if we have a slot free.
> 	 */
> 	for (i = 0, c = console_cmdline;
> 	     i < MAX_CMDLINECONSOLES && (c->name[0] || c->devname[0]);
> 	     i++, c++) {
> 		if ((name && strcmp(c->name, name) == 0 && c->index == idx) ||
> 		    (devname && strcmp(c->devname, devname) == 0)) {
> 			if (!brl_options)
> 				preferred_console = i;
> 			set_user_specified(c, user_specified);
> 			return 0;
> 		}
> 	}
> 
> Note that it was inconsistent. A passed @brl_options prevented updating
> "preferred_console" but they were not stored.
> 
> Note that the console_cmdline[i] entry is considered a Braille entry
> only when .brl_options are set.
> 
> I would fix this inconsistency by a separate patch:

Grr, I sent an older version of the patch. I later modified it to
update the entry only when it was not set before. I wanted to
send this version:

From b4e425390a42bedb5cd19a8bc959b6d1c4a61d49 Mon Sep 17 00:00:00 2001
From: Petr Mladek <pmladek@suse.com>
Date: Mon, 9 Nov 2026 16:01:35 +0100
Subject: [PATCH v2] printk: Update Braille options when preferred more times

The current behavior is not consistent when the same console driver
is preferred several times as Braille or non-Braille console.

In particular, preferred_dev_console is not updated when @brl_options
are passed. But @brl_options are stored only it is a new entry in
preferred_consoles[].

It is even more hairy because preferred_console[] entry is considered
a Braille entry only when .brl->options are defined.

Make the behavior consistent and always update pc->brl_options when
@brl_options are passed and they were not defined yet.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/braille.h | 7 ++++---
 kernel/printk/printk.c  | 6 +++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/kernel/printk/braille.h b/kernel/printk/braille.h
index e9790c28027d..7a845caf4082 100644
--- a/kernel/printk/braille.h
+++ b/kernel/printk/braille.h
@@ -5,9 +5,10 @@
 #ifdef CONFIG_A11Y_BRAILLE_CONSOLE
 
 static inline void
-braille_set_options(struct preferred_console *pc, char *brl_options)
+braille_update_options(struct preferred_console *pc, char *brl_options)
 {
-	pc->brl_options = brl_options;
+	if (!pc->brl_options || !pc->brl_options[0])
+		pc->brl_options = brl_options;
 }
 
 static inline bool
@@ -35,7 +36,7 @@ _braille_unregister_console(struct console *console);
 #else
 
 static inline void
-braille_set_options(struct preferred_console *pc, char *brl_options)
+braille_update_options(struct preferred_console *pc, char *brl_options)
 {
 }
 
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index e248f2d0d01c..60423c765520 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2665,10 +2665,10 @@ static int add_or_update_preferred_console(unsigned int i,
 	 * Historically, the preferred options are stored only by the first
 	 * caller who prefers the particular console.
 	 */
-	if (is_new_entry) {
+	if (is_new_entry)
 		pc->options = options;
-		braille_set_options(pc, brl_options);
-	}
+	else if (brl_options)
+		braille_update_options(pc, brl_options);
 
 	if (is_new_entry)
 		INIT_LIST_HEAD(&pc->preferred_dev_node);
-- 
2.56.0

