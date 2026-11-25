Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612019;
	b=BFJpCrGEkEikWNmUv7tqC+Uj5Jm45uvTpK4e4HnO5Ae68VLCu1HCGEpGLzVM+Rnm/aQN
	 x93xzlW2qmbWNrP+K3yjVmQQoAhI/A9sTF7dJB0Ena4nIhnetqkc8LKTBCTjZPF0EviVI
	 xhbkFHwUUG/4Sk3qCKEDfEKlePPnTGU9oGEIHLCGsZv4wpVEpkzy0gKGjCxgtRexZUU00
	 EYEMgCCUSJ5Ejuj54bVCI7zToxTPMYDP4bDoWwAKo+aNHR6867aqB0W1H0irvHy2Mxv2l
	 h4UV45XNOp18usvwbm0fZQRWJE1nwi8AR42GBuK5tUG1ZWbjvjhV5IR3VMpKr6gLNig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BTG3o/gfnhJbNoTu/8LWA+1k6i1e7Av0FFvwUtyiWVg=;
	b=cVtiGVX7aEeHDiDe3D19TMhljLmWBs8Hydho57MeBGoG1ZGKqX1oSwhPpAmC2TDSDdEZ
	 Qe1KU7JkbL5gwDP1IAqdAJLaHDR3BJYy47B+3nprdG6Qlufsgi98X1UQ1C6HBIap8VQtw
	 RxLc14Wtx0+k081MqmoUbn39bOMMOcN7OZMSNFX38YZjQGNls7cBGd8j5qvKTRM9F7jJr
	 LZ/unjx6FQ8ntnhE+0atuZlvSwOck+r45H+IykqmUfJbdVy+l6lKcSzBU3/FTfY/geVRj
	 uIbM6d+AD1z7We50oLzikhbJv6+OZbyE2NGnbz262+6giYbGHWvV8mvaSspPOMpdNDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Y2KxyGBm;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BADB606A327
	for <printk@lists.linux.dev>; Wed, 25 Nov 2026 13:06:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BADB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Y2KxyGBm
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so48962885e9.2
        for <printk@lists.linux.dev>; Wed, 25 Nov 2026 05:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795612017; x=1796216817; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BTG3o/gfnhJbNoTu/8LWA+1k6i1e7Av0FFvwUtyiWVg=;
        b=Y2KxyGBmYx5sC8LowN3FYIhAmS2RMbWeHrlKOPydGcJofPdqqxCcnqkyxC1kx/BA+c
         U+barB33PAbQL8qSidLs+loMQf7bPRjJQwTd2Q8GrtrY6zfsmgKpihAJL9gKhDFJ2me3
         3ngO0snrv8jcku6bg2IAZTpvRs+NTo/8ZtSFZ+EFE2X5Me0yfEKazghJZSL1ZiioVbRq
         K5YLDaURRur+0h//cnQnonuXhNyvdmPMZmvzfx0pDLgqCUM/sqRoeHB50KKYo3r31fdI
         W3sqFWCbbNsSZk5etZLQyHKSO7tgbc8voSKTPYM1ISMNU5Ef4pINHhBEhPh5gV3uUgqb
         WMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612017; x=1796216817;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTG3o/gfnhJbNoTu/8LWA+1k6i1e7Av0FFvwUtyiWVg=;
        b=bgmOBPuUK1Ae1ZTo+dAv4nPlG0O7cMd7IQCVsMLtCe/PXDLPdB38wIT+2/kdmDSW+1
         ET1+0uixM/ENPd24fUO5UeA1bpySPmJtozxMx87i27J3gnn/H2SuLZK71cRScbCQXqMq
         A5bnPEgeyeL1hU4yJu0V6hmO8ooyNtMlGKXySdFWYJpWES19jdRC00cbtHvGIOAOgmSD
         myd0ILt1LAqKZUxHfhEtfb124qxwEhr/OIMtXHw9Lu1wFmVfqwcX4EuAGt39mecy6TpQ
         5rqK8INWO8ghrQz8df+Pe6oqYMUXuD4yR+s5oDVgeym+Yg5Wx0M+WMxhbLYFjdoNWnrC
         gsvQ==
X-Forwarded-Encrypted: i=1; AL+hErGqEGr+qMkbiD7Ej/CraBLJPNjjpQU8iskwWQh/y7GKJ6J62yW7PDfMec+IwBF7cORG4GdBUj0=@lists.linux.dev
X-Gm-Message-State: APuU4Z/P4Ij4rfMrvVPozZbe6ea1WFWccw+TdIPXDUntB0E9L4T7MeaD
	ix2qNLO1/A0eGPX/lUYv+1aLE0YfEAlOpf5z/0fK+3nhc0PGzWzs2oxcnvBovRk59ms=
X-Gm-Gg: AZFdTZcCEEJ068DcSARIeVN1kfTuPi5yKwxb1z4tRpZ3IC7jVjWgaEnBj6TDD/dAOB4
	GdGbHmXpw5+Vx2qiD3wshtn2Rx1LgoviBhu3OXDVN3zlkt3/46hKU4xjmmzMVNkCY/AnAW05xYE
	um/OI2x2SlIDQqv79gn9kF1gcrZ3fUGan2GigrLghKj/d8s1uHFMxTUV2WWBhtMgtrk5gUd9E6P
	qd3a3tyqgVlmCV6Iq9n44bKjVrac8JE4h8IEyfASl/7Gzd4K4Ct7p+nMtvp7AuK9jnGmwLXYIns
	oucUQ7BaA8VnwT+g1xJ+CEuvTTPu76hHXbLZJjlVzcnftZmR8q9D0UDF2FMvrspKF73zw1vVGd6
	nI/rtek9Fhgl7BNMvy3hZMeU1DwfQBI2ieerR89g8myqLrU8+1hoVRo10ilnHFiFRAX2/vTGqmg
	XlMAU8o5nxA3F31li0NshlzQl4QG9kbltLkoCzXOqOIZ+vO5ITDFJELKxyqhHwbKDf3CBeclkni
	mBV3rE1K4B83PVdNlpDIZRLMqVWvZlu8DN8L06gRyWSIVy2aqrRqfA1VZ9MhpmM3kc/UHJDMHxf
	5cNkCtGuFEAx1wZ4bzctsbBkO2Y9Ylb56jwxOjglzL/Y9g==
X-Received: by 2002:a05:600c:828e:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4bb8878702emr387477015e9.0.1795612017395;
        Wed, 25 Nov 2026 05:06:57 -0800 (PST)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm677180135e9.0.2026.11.25.05.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:06:57 -0800 (PST)
Date: Wed, 25 Nov 2026 14:06:55 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>, printk@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH printk v4 5/8] printk: nbcon: Expand unsafe takeover
 check for general unsafe
Message-ID: <awbdbzUgE0guw2BO@pathway.suse.cz>
References: <20261121163557.963029-1-john.ogness@linutronix.de>
 <20261121163557.963029-6-john.ogness@linutronix.de>
 <awa28PGg8L4rEDha@pathway.suse.cz>
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
In-Reply-To: <awa28PGg8L4rEDha@pathway.suse.cz>

On Wed 2026-11-25 11:22:40, Petr Mladek wrote:
> On Sat 2026-11-21 17:41:53, John Ogness wrote:
> > Currently nbcon_allow_unsafe_takeover() is identifying if hostile
> > takeovers are permitted.
> > 
> > In order to support unsafe flush policies for CON_NBCON_ATOMIC_UNSAFE,
> > there needs to be a distinction between atomic flushing using an
> > unsafe implementation or atomic flushing via hostile takeover. The
> > former could be allowed in non-panic, whereas the latter is only
> > allowed on the panic CPU.
> > 
> > Rename nbcon_allow_unsafe_takeover() to nbcon_allow_unsafe() and
> > change its purpose to identify if unsafe console printing (in general)
> > is allowed. If yes, hostile takeover can be allowed when on the panic
> > CPU.
> > 
> > The comments for the WARN verifying no hostile takeover attempts
> > during non-panic have been expanded. The detailed description will
> > hopefully remind us of the necessity of restricting hostile takeovers
> > to the panic CPU.
> > 
> We should make this decision on a single place. I suggest to rename
> nbcon_allow_unsafe_takeover() to nbcon_check_unsafe() and pass
> *allow_unsafe_takeover as a parameter. I mean something like:
> 
> /**
>  * nbcon_check_unsafe - Check if the console is safe or some unsafe handling
>  *	is allowed for the given context and reason.
>  *
>  * @con:	The console to check
>  * @reason:	The reason for the unsafe console printing
>  * @allow_unsafe_takeover: Decision whether unsafe_takeover is allowed (output)
>  *
>  * The function decides when either an unsafe write_atomic() callback is
>  * allowed or when all NBCON consoles are allowed to used the unsafe_takeover.
>  *
>  * Return:	True, when @con is either safe in all contexts or when it is
>  *	allowed to perform unsafe console printing.
>  *
>  *	In addition. the @allow_unsafe_takeover variable is set to "true"
>  *	when the console is allowed to perform the unsafe_takeover. Otherwise,
>  *	the variable is set to "false".
>  */
> static bool nbcon_check_unsafe(struct console *con, enum pr_flush_reason reason,
> 			       bool *allow_unsafe_takeover)
> {
> 	enum nbcon_prio prio = nbcon_get_default_prio();
> 	bool ret = false;

This is called also for consoles with a safe write_atomic().
The check should pass in this case. So, we need to pass
the flags parameter and set the initial "ret" accordigly:

static bool nbcon_check_unsafe(struct console *con, short flags,
			       enum pr_flush_reason reason,
			       bool *allow_unsafe_takeover)
{
	enum nbcon_prio prio = nbcon_get_default_prio();
	bool ret;

	/* Console with a safe write_atomic() pass the check by default. */
	ret = (!(flags & CON_NBCON_ATOMIC_UNSAFE));
	*allow_unsafe_takeover = false;

Best Regards,
Petr

> 	switch (reason) {
> 	case PR_FLUSH_RUNTIME:
> 		/* Never unsafe flush during runtime. */
> 		break;
> 	case PR_FLUSH_HANG:
> 		/* Always unsafe flush on panic hang. */
> 		if ((prio == NBCON_PRIO_PANIC) && panic_on_this_cpu()) {
> 			*allow_unsafe_takeover = true;
> 			ret = true;
> 		}
> 		break;
> 	}
> 
> 	return ret;
> }
> 
> Then we could use the following in __nbcon_atomic_flush_pending():
> 
> 		if (!nbcon_check_unsafe(con, reason, &allow_unsafe_takeover))
> 			continue;
> 
> Note 1: We might want to refactor the function when we add the checks
> 	where to allow the unsafe write_atomic() callbacks.
> 
> Note 2: I thought about calling this directly in console_is_usable_unsafe().
> 	But it would require passing the *allow_unsafe_takeover as a
> 	parameter which is not needed in most situations when it is called
> 	via the console_is_usable() wrapper. But it still might make
> 	sense if we make the parameter optional (allow NULL).
> 
> > +
> 
> >  		nbcon_atomic_flush_pending_con(con, stop_seq, allow_unsafe_takeover);
> >  	}
> >  	console_srcu_read_unlock(cookie);
> 
> Best Regards,
> Petr
