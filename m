Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615707;
	b=czqObrdVJuO86SfZ4KqXV0FEGiddsfdHbQViFo9ei+h3T5aLs1gsOCGFQvuf5qAYs+OO
	 WMEKji21/WaNPSzKhL/W/hc5LtYKslbyG4EgRIaS5A32qKtaue6UQJdBRzD8Bcmb3vMbt
	 d6vShKPQUhsKZWXUj2Vf2lRm4bsQomHhf/He5usy9hAAo4ZfxB0lewld8oRwf4+AKCoAN
	 8+KxS+rPw8ae9i+1F095thRsKZKYObcmYbweOsJ/vYHQFLc0cjoEFGomDwSdjCTbXoK4b
	 XNIXaYf8HONPys3tw05hBqFqnM6YFyfQZioPIscJ1MaHZhL3I5NuL5XnTkuR3+8+qkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=WRZsidmdVV9MmuhVngxLRixfY4ChNMd3+703cMo+eqI=;
	b=fwkfmWgx2FOk99BB1WV1sPGMh0xe6Y6iDga7+syrKvTa0Cud9eDR/PATeTLpexZ8LBg3
	 1HiYOt9IZzZpLbRJIgpfVansvxN8h45MRaOcO8kDQK1prPYPSd5uz/eRqU3/UueE8PzaH
	 KXkIXuZdqu/sRwZiWJecODq1dphUdneqE6+7qLKPtFJNOyO/VVpYTYUMSDrDnrbM4z/cM
	 Ou58xr3k9CglwSYeVFHRtrdrOl3iZr7+v7key9ZaRKoNIzMz2Qid/ZvevkEKXRmA/ckpp
	 /Uc2wrjG3P11qTz0BXBnzrqXYoNfYgWCY6lhhVwNWdJ4Eg0bke92z5acjcPE4NDYlgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BnI0dx6e;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A1D60A260B
	for <printk@lists.linux.dev>; Wed, 25 Nov 2026 14:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01A1D60A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BnI0dx6e
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49465892f7bso4228920f8f.1
        for <printk@lists.linux.dev>; Wed, 25 Nov 2026 06:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795615705; x=1796220505; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WRZsidmdVV9MmuhVngxLRixfY4ChNMd3+703cMo+eqI=;
        b=BnI0dx6eyBD7UvBl49c31Dz88M+Sj9c8EaKpqEhcCREdYtbkg0SYQAQsPML1uCWpyX
         oSIQoxaiQJqbX6cpSRce9OECG0faMqmMjqkjKgyz/sTH+q3Q2/EEghTcqvYoNG5St/B/
         vUPLwtHhDdqQ3VamilzgOlebk0YTnZYJrODUUZi4rhmGoqbynWSub+CkUJgqbOkxj1zs
         wBBxaoHTbvFNmtHhbeOcxcsszuHnizoC5hse6BqJ6xpjmUVq3NDqoZ49TnylOj7YcAaY
         fF9VhT95Bu3uTwlY0aoX2MA/IjATjQU6abtpHVWB31ao/dGJcgX/W7zjhze10tBphOFn
         Pgcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795615705; x=1796220505;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WRZsidmdVV9MmuhVngxLRixfY4ChNMd3+703cMo+eqI=;
        b=UUN7hoTTByXCnYU1XLLKJzjF5Xw6W/RUh1WiY7VATnQrzrgTw7NeLz96O/MSNqSGwP
         7l7aq1oGGeAL8cSHgb2uREWNPtQlXblsBU/hl6pO87OdzV+c+V7b8uNgtMNeAWKaKrgU
         LFCOuIAOnX3ZRFuEBIiNx0BsinNNP/YA6hzGxWrWqWg9fv50s/6IBfGl03w7RFXFqoUL
         8h7fD94KErbVjdUNwuaiEDReqXzhL8ojCdfImkudEKU9IGE2vEA467MfsZ5BufWdHAG3
         KWXTCQZ07KC+cMl5lQwa6XMiMaIL39aZoB7ts2lgYJZBtvz+XIOG3usiiMTa5+Hk42IO
         6ztg==
X-Forwarded-Encrypted: i=1; AL+hErHDnl2b57jPDAzzyZ9pKCGNEobz0zNkUZ0hgMuTep8OgpHSdTPy/CKxIyBHgO+psOADuESI1tA=@lists.linux.dev
X-Gm-Message-State: APuU4Z/t5J+x/gZQdbRUxSnnReO+RUR4N38uj3WoBRYHZv8cPdHGzWko
	thYUDNwWM4WWUYYjT65C/U5xUTU9UX8yg9s7WyU/PTeQznwL1UyWBcY1E4RDysZrh0U=
X-Gm-Gg: AZFdTZdC2V2C2VVcQ3EDIzmLw02EhmoYJzYU/i7+/+QnH+qePKk6jBbi884GvmhN+0Y
	CaOwYfFJ5dHsCytTjZr8jeHyUaTGVkOIhrCrgbkTVp/kpvbIqIeoMfdJTMcAuCcr/0AICDr4B8d
	TUv3tShICdCaP71bEXZBHkVlxF+FnS/wNF6OGBHm5frUmDAGTgY8gfg80UG8Hx7iiTpIWs4nsl6
	rlMLyveIAFZrysH+5EOofNewCCOYeghmDhhNlY611ynvG3YnoLvyUaLupiaKwR4Jyy9gn7balSI
	2Ofxqw2eO5TGhfkEk91Ci/HSjZPS2BecFyhjRwIAJ+pkp077/5Nq1DI5dRAkd0SBpZZa4MxKYn1
	zKuLPskj6b60TwyyaZRRbkyqDYErBLLPui1gQJzxchO/c+rNBlSUi9D7awzrxr2Xu8eynAbtX57
	W7/zsJhlkN+ysFFGkkjQp09GkS9T0na2Ib/D+3otvtb1MCixuZ2b9pbhTVK2TmSgZWKad43RS6u
	NirdVWGCK9bZ7vO0j8837eLw6s5s5+YXpiyNICTEP8485IybXk/Gq2lSjrg5Mw0k7eU73vB0sl2
	iMU1DMJdqZaAZgLoV+P2ETQxHJUAX+M/TGLcqwEs9itwww==
X-Received: by 2002:a05:6000:4704:b0:491:6a7:b4ac with SMTP id ffacd0b85a97d-4abb5eabd6bmr34992361f8f.56.1795615705236;
        Wed, 25 Nov 2026 06:08:25 -0800 (PST)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989b3sm34510403f8f.51.2026.11.25.06.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:08:24 -0800 (PST)
Date: Wed, 25 Nov 2026 15:08:22 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>, printk@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH printk v4 5/8] printk: nbcon: Expand unsafe takeover
 check for general unsafe
Message-ID: <awbr1gCJTiLQB4he@pathway.suse.cz>
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
> 
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
> 
> 	*allow_unsafe_takeover = false;
> 
> 	switch (reason) {
> 	case PR_FLUSH_RUNTIME:
> 		/* Never unsafe flush during runtime. */
> 		break;
> 	case PR_FLUSH_HANG:
> 		/* Always unsafe flush on panic hang. */
> 		if ((prio == NBCON_PRIO_PANIC) && panic_on_this_cpu()) {

The panic_on_this_cpu() check actually is not needed because
NBCON_PRIO_PANIC is used only on the panic_cpu.

Best Regards,
Petr


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
