Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238184;
	b=duRI76U9boD5GB9cwI1paR35d2y1acanG3BTO1Lwzjw9AcOc3T30duvKYj87Xu1je78V
	 WAHrhY7xDH6pEsGe26F+n5AbBC6vZMUOA65sMaXY9V2Lwu1hn/Wgg6uyVCW73oy4OH7pu
	 GIN/DiDj4Opltf0PFk+xeEwG+5YpDxSs3tDv0ENsp5YSWafskF9eq08wdbPdw/ZuXz0VK
	 yUwIU3Qn6bHHI2OXNUsfUZ2hsV9VF6aRyre1tbJ5euEUHdeCz/OX+aGmcI+IXNl++cEbI
	 tHjD/fHjzlA18iDwgGQWQG+BG7U8VhMbERVZLWQ2YdeSOAVNLJAG6Dg1hc4DwzcccbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=tH1jMVDTbLHgXX9uncHB3H+dPepNsist1MAiY4eBEFo=;
	b=JRUJ5m4cgHsjSa4FDJFgPC63wCozGt+WkduGonOujetrvbPILD8ullJ/mgykLn4XI9k0
	 k2gj44FnZsv8a9wnuM1tRvx+r0Z2T2BmpWlGmVlw/djhN04Ty7xXCxRqR4fc78s8ejpNv
	 2G5fOhpP7xvkisDrB1Y19WB3M5GOI2bz8s4N6l6Vk2MfryuugwgvfKFeWB/jgO7kWF0eb
	 S2jlkQJcQ/Kiz8jCuBQTqjdgOj4xuzZcLjg2z1zTOwhnh7zSbcb3wfCjcRpLMTJkQzwnW
	 gI672/JT/9s7feD99lnWjdEgPOYtkWUOL9B9hrKbUpMKK97eaL762kuNLledZLBmD9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YQJn1wYW;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C99606A321
	for <printk@lists.linux.dev>; Mon,  9 Nov 2026 15:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21C99606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YQJn1wYW
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso10549665e9.1
        for <printk@lists.linux.dev>; Mon, 09 Nov 2026 07:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794238182; x=1794842982; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tH1jMVDTbLHgXX9uncHB3H+dPepNsist1MAiY4eBEFo=;
        b=YQJn1wYW9cSHR/ciVngQen51DHsvjPODkopVtH9ToVOmgo4UPxYMqCAq2D9NoFSjMc
         T9XoXQvwd2yXVWTJTrt8hlgtxe+J7ywmhI2/egk5uyO00jmo/jtom/oHw7UQem0w5FSL
         AIWzqRdkXvC2AGWpW6ppc24l4jnVkuPb+Ccd77ZEa5lYPjga66ZuSdeGhNmp3ZyWGmqr
         9meHzJYrtNnKmC0S9GOZEvqhRPUJ2jnJ0IZJcRJsF0f3ErB1dhiTwt2JFKNfV50Yq2xe
         WOPXwbxHJsRHlA76DJtvhjrxh1WVOPL2if3NgfjxvcouelPlhbP5DBBe6wKY9vwBu5ZM
         SEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238182; x=1794842982;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tH1jMVDTbLHgXX9uncHB3H+dPepNsist1MAiY4eBEFo=;
        b=Y7W4jAqcxLxImnmQi9x/WTeHa7bfV9QJBq3cZNHGgQUYq7XAsFjGleVnpf7jPBqnAF
         boAKM4pMgnmAhWOMvDoweJoug+4Z8jDjqGnoJQ5ETsXs5nkGOEvLBJssws6TLfzRTGPn
         nQf0fno+nsma7zFzHaxVV7/pUAYBreSVeENc0X3cHgnRF2Bb/lqDXqyV2sh1JjHl0bNI
         cKMbrzfht+MjUl0+WHXc6xD4LQ6gX/ZqkQMa5HLHatAoizMvmF2nPZ/80Bc65neo0mxQ
         mHX/NAeTVP9O1Ehcv4tq27TjHyIgn6UPy/eh44TPxslkyZQZhGTRqLjkkRb0pq1EEVA8
         hVfA==
X-Forwarded-Encrypted: i=1; AL+hErHxM1T7XWsaJE1sgdZIYZ1hRKgGUqd5bKaMTUu7R8+npoMa4PBVjBR1BeH6Z5PzRNp6AGK6qj0=@lists.linux.dev
X-Gm-Message-State: APuU4Z/+Q4yTr4DJpKEkmUYQbXr0Xa/yArVzYEpg12qLZ6VT9M6vB1Vf
	ivC9In/rb5rAF//oMJWOAHoY961Wg7pCwGU2+tJ1idFM/57xiyOaKzcYJVJwbfReh4E=
X-Gm-Gg: AYBFou0ZK6gF8AKJtnN3EEtiQtegO+B4qLGmHeCgREmB7LbIVwM+m8B2s0W8agnc7w/
	7Oa/kY68QRF47WB/EeSIkfJnSR7uMANssOqO8r1kkAzo4nzCcJ3HtrMv6YZwM9M/jmPA8XfQZx4
	vLi+47wDBhZNf6vXRznEEgIw+/LgLNLDDb2pV7com4+tL4IyBD9NfFLNcF9c4tculJNb9b1AAV2
	fxpCBiD9fX6h7p2TgM5Q2R6dVXscmuV8i259iCXx5TvenA9T6xRcmiqmsGt4ZeM3g/Xuvpx8lAr
	PN27v09uXUkTWjtQ9RTzi3gl7XVu5KDkfBdTTrhTm3ezgQORgGUOh9pbLE+n3jhJY6jOhL3GGLH
	B285qyP2ffsnOWNSI7eghnTD8Oo30ONR4ZIkGjRpSPBuV2WoymtqSa+4vFM4+xJIQ8kofm2EtaQ
	y/rMkLt7Eu2BmbLD096oRIxrCx84YrcFtcZSKMZ4nN2xqjUN9ngOt9UWMehqkac2Z6mHSHvxrec
	jqE3u4NAxqlsv+HDRS/WZGCM3Q5hvo3D7ZWrLezrLQeYwAN2SMlQb1hFY7b3FK4p/OfOadu0/AB
	qPrNCt30wpvhAlwn8Y/HnuFoyovoIw==
X-Received: by 2002:a05:600c:4eca:b0:4a7:6425:c274 with SMTP id 5b1f17b1804b1-4b94d7630d0mr80169055e9.2.1794238182334;
        Mon, 09 Nov 2026 07:29:42 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b79501502asm166258865e9.2.2026.11.09.07.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:29:39 -0800 (PST)
Date: Mon, 9 Nov 2026 16:29:33 +0100
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
Message-ID: <avHm3aYaDdcif-ss@pathway.suse.cz>
References: <20261106171952.207909-1-pmladek@suse.com>
 <20261106171952.207909-15-pmladek@suse.com>
 <sashiko-outbox-201949@kernel.org>
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
In-Reply-To: <sashiko-outbox-201949@kernel.org>

On Fri 2026-11-06 17:36:30, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] printk: inconsistent Braille state in
>   add_or_update_preferred_console()
> --
> 
> commit 7297fe2fd570a081c485097cb3f11fae0fc8a9d2
> Author: Petr Mladek <pmladek@suse.com>
> 
> printk: Do not set Braille console as preferred_console
> 
> This commit replaces the preferred_dev_console index with a linked list of
> non-Braille preferred consoles so that redefining an entry as a Braille
> console does not leave preferred_dev_console pointing to a Braille entry.
> 
> > diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> > index 1aad21c082c99..efc695ca9d13c 100644
> > --- a/kernel/printk/printk.c
> > +++ b/kernel/printk/printk.c
> [ ... ]
> > @@ -2649,10 +2656,20 @@ static int add_or_update_preferred_console(unsigned int i,
> >  		braille_set_options(pc, brl_options);
> >  	}
> >  
> > -	if (brl_options)
> > +	if (is_new_entry)
> > +		INIT_LIST_HEAD(&pc->preferred_dev_node);
> > +
> > +	/*
> > +	 * The last preferred console should get associated with /dev/console.
> > +	 * Except for the Braille console which can't get associated with
> > +	 * /dev/console.
> > +	 */
> > +	if (brl_options) {
> >  		want_braille_console = true;
> > -	else
> > -		preferred_dev_console = i;
> > +		list_del_init(&pc->preferred_dev_node);
> > +	} else if (!is_braille_console_preferred(pc)) {
> > +		list_move(&pc->preferred_dev_node, &preferred_dev_console);
> > +	}
> 
> [Severity: Medium]
> When an existing non-Braille entry is updated with brl_options (for
> example, console=ttyS0 followed by console=brl,ttyS0), does this leave pc
> in an inconsistent state where preferred_dev_node is removed from
> preferred_dev_console while pc->brl_options remains NULL?
> 
> braille_set_options(pc, brl_options) is only called when is_new_entry is
> true, so is_braille_console_preferred(pc) still returns false after the
> update.

It is a regression since v5 because I removed the questional patch
for overriding console options, see
https://lore.kernel.org/all/20260929120546.328616-10-pmladek@suse.com/

> As a result, __try_enable_preferred_console() skips pc during the
> Braille pass and instead enables it as a normal console without
> CON_CONSDEV, and if it was the only preferred console, preferred_dev_console
> becomes empty and try_enable_console() also falls back to
> try_enable_default_console().

Note that the same problem existing even in the original code (before
this patchset). The original __add_preferred_console() did:

	/*
	 *	See if this tty is not yet registered, and
	 *	if we have a slot free.
	 */
	for (i = 0, c = console_cmdline;
	     i < MAX_CMDLINECONSOLES && (c->name[0] || c->devname[0]);
	     i++, c++) {
		if ((name && strcmp(c->name, name) == 0 && c->index == idx) ||
		    (devname && strcmp(c->devname, devname) == 0)) {
			if (!brl_options)
				preferred_console = i;
			set_user_specified(c, user_specified);
			return 0;
		}
	}

Note that it was inconsistent. A passed @brl_options prevented updating
"preferred_console" but they were not stored.

Note that the console_cmdline[i] entry is considered a Braille entry
only when .brl_options are set.

I would fix this inconsistency by a separate patch:

From 25b6c5669758152119720dec79338bf59fde9484 Mon Sep 17 00:00:00 2001
From: Petr Mladek <pmladek@suse.com>
Date: Mon, 9 Nov 2026 16:01:35 +0100
Subject: [PATCH] printk: Update Braille options when preferred more times

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
 kernel/printk/printk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index e248f2d0d01c..3892cf036498 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2665,10 +2665,10 @@ static int add_or_update_preferred_console(unsigned int i,
 	 * Historically, the preferred options are stored only by the first
 	 * caller who prefers the particular console.
 	 */
-	if (is_new_entry) {
+	if (is_new_entry)
 		pc->options = options;
+	else if (brl_options)
 		braille_set_options(pc, brl_options);
-	}
 
 	if (is_new_entry)
 		INIT_LIST_HEAD(&pc->preferred_dev_node);


I could add it into v7 or send separately as a followup fix.

Best Regards,
Petr

