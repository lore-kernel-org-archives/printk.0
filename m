Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795536832;
	b=tTeUO+6uwsYAWXhMcNFpi0/Qo5kUXV3AtVjinbEE8So+PC5uOHQYtxkLqQ0HRPRv5Q18
	 pU0UIANflpvTxrA14nmVUAdKPb8MTDOmeYoxl5d6HfGVg5PRs0qORE1jQeSuiSTkCFMuA
	 3MVJMHXDSkNZKF4vgR6V/FPz754GOrvE9bIzn70TbuDjh9mvGXZI7ghyupPQNAFTMDTQg
	 TJ3y32t7ZSLwigGBwqIb5EY4KZ4yGsZ2S7NkK1nszhg+hjFB+lkG4DWWdhkEeJW6ww2oa
	 hvzz3olq2xvsKaeCuSZ/4DxkaAkadGu3fcNoTU5WZTx/Ccbt8TkxmPtdPdrThxuuSEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536832;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=LBJUeeLBd/j2UQXVukjFGjfTw0JwauIgVax6uPLXyWQ=;
	b=mAhSaGVwzMuR8Lfg46xYolF/sRSVprt7DUCu3pXow8Xe6ZXvqcx+cOdsL1UqgdipWe5G
	 7njAeonNgMMD1aUsMhIktW1Ij2qulSXsfrMuE8Nb0Tq3sem8pXbzFT5gEiLrqeu0J0N7T
	 nVn/9g5srSkyduYhAUvnWg/5/PpS67y+PLdPQ9tdKbv1K/kBSGSZ7Xh7W5/7b8JJA66qk
	 MeLeVBDfgM1Fdukv3H1ipDyU1QxIZuHmxECknuVYxJROHuNa+Wh1AqLdZ+XMdVJbrS+7u
	 7hooQ0beFgAQSWssONsnuDgWTu2y/NZah2is5LDo55ZUuPQWVs9agfMeePvAUEhKzDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KiNpaa68;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B482A606A692
	for <printk@lists.linux.dev>; Tue, 24 Nov 2026 16:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B482A606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KiNpaa68
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so45867785e9.2
        for <printk@lists.linux.dev>; Tue, 24 Nov 2026 08:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795536830; x=1796141630; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LBJUeeLBd/j2UQXVukjFGjfTw0JwauIgVax6uPLXyWQ=;
        b=KiNpaa684UQ4iKD3SAMqX/uNKyj1Up7dYLY3O7y0xesR3SJwajn2KUv8cZl/3wB+nI
         ruJgnHHC6FFTMoO0GrkH4LoyZV2z2UUD+ihtAqxxDoWjOTI6oiGDjWMrfFlveP1kRZXq
         XLYod/gcAtZL9snHkqWQFRrVCn3zerJh73xsl4UBWi7VhjuShvW5BP/pY8EWFeFy2Dtd
         ZCu5hkLpQQiNyJFogth9/zCR0zKhxVm0w7gdwlINhCHAnl0KtdOgeyn5RpQjAt6fO4au
         lAAuyBxv2vElJlpBbCmL5dXT+zsKqxHATUMN4ZMthK+/voU3aQaetg8dIm9y3htBOP+c
         YW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795536830; x=1796141630;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LBJUeeLBd/j2UQXVukjFGjfTw0JwauIgVax6uPLXyWQ=;
        b=MJf3bds9J7z72z+T0SK/tJO3wNNr9JrFVd/SWxPGXPvl1UR4dVvPQthUPGaf9SSYht
         J4xv0UVEz3QNsKLa4i9qMytUdphXwVg7EIWKXUb+6k4uNjtJns+GvWfvkh9rRFrVGU6T
         1VUI6fXmvOWIekYXys2+yIZ1NLCkyncPbXw5xGuxFS1t709sFrgs3ymqh2xTG2V3vTb7
         yY+3qX8jdJcaO/T50iNX1Kw8G1ZQGu+ygXP0qMFSihukn8x2tMXrDiGygNp2XQW5Ze+f
         1g/Jb8ZhyELKrQUdum86YUh6/KAjXVQNzidp7U52etphqWB7KGSgw6pgwKSZIWTxX9V1
         SrZg==
X-Forwarded-Encrypted: i=1; AL+hErHC7vNayHxgN4cnh8hXYBpJIxnfMSqnI89nWlDMiIyRmFiaWIX/4eF9oUu9++rpTpS9uBxcYLU=@lists.linux.dev
X-Gm-Message-State: APuU4Z+u2IPDLZbVZJG0jvFXt1o5mbXiYJdRSBz0gxx81podvTK1UTfG
	vXztNFXvoc/yJuWcH2/n11HZGQjSonCC0cLWaAvVafI9YkqDk1gmFigStEZ1PHKA9QKFLDq7M8R
	ts3Bcoxw=
X-Gm-Gg: AZFdTZeP6VVyoyBiukYN0WT3zJ94dg5aa0WaSLtYp6zIoZetlV3jGmGUnnz2cx0Ltec
	xD1kHcbox/bGqOX535gqsnG/lLBTKgl/l9dauc4e0gNu1PiylUFeF1GEYV4S4x/BIi38Fe1uytN
	q9HF72G/WyT4/Zblp7cVqkkTELxpL/plXZJnlxEnDDs7w0iT7zHFMOpJs2zPB3Be2wdo6kWShHw
	5DGyeTZz6RGzjnTI/M/MV3Wr6mVpx1647PsKJyHov4zte1Snl8hHQHkfn2AmlV+RAZbW5k9IIJt
	+KkRx3HGBPVNEnO4Jcvx8lnvx4F9wqsVE4A4RVaLwIIACaK9+kQYGYwzziCP3ka4ggTUBghs3FK
	ObIcE57Kj8B32H53GO9I7NRXFsByJKagmFkzEWJybSxgTDdLjhoaY8UhuVgjDyiU5uRA6BZVOQX
	jxMY0dv7QhkUijQqp++Ll3raNiqDf3dM0rd8MpxiXnScJALUVF8CrVG0kMX4sdPQF63rsnfzyc0
	wASFpxO+NLphzsXRBTR/90b1nwrkf9wdJDotGr2iE1vqN19OoaEldaUAZdXZ09lahEJX+lqvGV6
	nEFVG8s+ddK1MutWavEjVUH7J4+FXnQo
X-Received: by 2002:a05:600c:4f4a:b0:4bb:6752:8413 with SMTP id 5b1f17b1804b1-4bb8880015bmr348896465e9.8.1795536830015;
        Tue, 24 Nov 2026 08:13:50 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb905f1489sm265449965e9.0.2026.11.24.08.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:13:49 -0800 (PST)
Date: Tue, 24 Nov 2026 17:13:47 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>, printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH printk v4 3/8] printk: Move unsafe takeover check out of
 console_is_usable()
Message-ID: <awW3u4xEwwbQARPl@pathway.suse.cz>
References: <20261121163557.963029-1-john.ogness@linutronix.de>
 <20261121163557.963029-4-john.ogness@linutronix.de>
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
In-Reply-To: <20261121163557.963029-4-john.ogness@linutronix.de>

On Sat 2026-11-21 17:41:51, John Ogness wrote:
> Change console_is_usable() to never claim a console with
> CON_NBCON_ATOMIC_UNSAFE is usable since that is the normal use
> case. This allows moving nbcon_allow_unsafe_takeover() out of
> console_is_usable().
> 
> To support unsafe atomic flushing, provide a variant of
> console_is_usable() called nbcon_is_unsafe_usable() that accepts
> CON_NBCON_ATOMIC_UNSAFE consoles as usable. However, this adds
> responsibility to the caller to determine if unsafe atomic printing
> should occur.
> 
> __nbcon_atomic_flush_pending() is the only function that enables
> unsafe atomic printing by calling nbcon_allow_unsafe_takeover().
> Rather that using console_is_usable() to select atomic printing
> consoles, use nbcon_is_unsafe_usable() and only select
> CON_NBCON_ATOMIC_UNSAFE consoles if the unsafe takeover is allowed.
> 
> These changes effectively move the nbcon_allow_unsafe_takeover()
> check from console_is_usable() to __nbcon_atomic_flush_pending().
> This has no external functional change. Internally within
> __nbcon_atomic_flush_pending() it means that
> nbcon_allow_unsafe_takeover() is evaluated after the usable check
> rather than during. The result is the same.
> 
> Since __nbcon_atomic_flush_pending() also knows the @reason for
> the flush, this opens the door for the unsafe atomic flushing
> policy to be enforced in __nbcon_atomic_flush_pending().
> 
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -625,13 +624,8 @@ static inline bool nbcon_is_braille(struct console *con)
>  	return con && (con->flags & CON_BRL);
>  }
>  
> -/*
> - * Check if the given console is currently capable and allowed to print
> - * records. Note that this function does not consider the current context,
> - * which can also play a role in deciding if @con can be used to print
> - * records.
> - */
> -static inline bool console_is_usable(struct console *con, short flags, bool use_atomic)
> +static inline bool __console_is_usable(struct console *con, short flags, bool use_atomic,
> +				       bool allow_atomic_unsafe)
>  {
>  	if (!(flags & CON_ENABLED))
>  		return false;
> @@ -645,11 +639,7 @@ static inline bool console_is_usable(struct console *con, short flags, bool use_
>  			if (!con->write_atomic)
>  				return false;
>  
> -			/*
> -			 * An unsafe write_atomic() callback is only usable
> -			 * when unsafe takeovers are allowed.
> -			 */
> -			if ((flags & CON_NBCON_ATOMIC_UNSAFE) && !nbcon_allow_unsafe_takeover())
> +			if (!allow_atomic_unsafe && (flags & CON_NBCON_ATOMIC_UNSAFE))

This is a good example that different people have different mental mode and
prefers another ordering of the checks ;-)

>  				return false;
>  		}
>  
> @@ -675,6 +665,29 @@ static inline bool console_is_usable(struct console *con, short flags, bool use_
>  	return true;
>  }
>  
> +/*
> + * Check if the given console is currently capable and allowed to print
> + * records. Note that this function does not consider the current context,
> + * which can also play a role in deciding if @con can be used to print
> + * records.
> + */
> +static inline bool console_is_usable(struct console *con, short flags, bool use_atomic)
> +{
> +	return __console_is_usable(con, flags, use_atomic, false);
> +}
> +
> +/*
> + * Similar to console_is_usable(), but allows atomic unsafe consoles. This is
> + * only interesting for nbcon unsafe atomic printing.
> + *
> + * Note: It is the responsibility of the caller to decide if unsafe printing
> + *       should actually occur.
> + */
> +static inline bool nbcon_is_unsafe_usable(struct console *con, short flags)
> +{
> +	return __console_is_usable(con, flags, true, true);
> +}
> +
>  #else
>  static inline void nbcon_cpu_emergency_enter(void) { }
>  static inline void nbcon_cpu_emergency_exit(void) { }
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -1468,7 +1468,7 @@ static bool panic_nbcon_allow_unsafe_takeover;
>   * This is also used by console_is_usable() to determine if it is allowed to
>   * call write_atomic() callbacks flagged as unsafe (CON_NBCON_ATOMIC_UNSAFE).
>   */
> -bool nbcon_allow_unsafe_takeover(void)
> +static bool nbcon_allow_unsafe_takeover(void)
>  {
>  	return panic_on_this_cpu() && panic_nbcon_allow_unsafe_takeover;
>  }
> @@ -1672,11 +1672,24 @@ static void __nbcon_atomic_flush_pending(enum pr_flush_reason reason, u64 stop_s
>  		if (!(flags & CON_NBCON))
>  			continue;
>  
> -		if (!console_is_usable(con, flags, true))
> +		/*
> +		 * Using variant of console_is_usable() to include consoles
> +		 * with unsafe write_atomic() implementations. They might be
> +		 * allowed depending on nbcon_allow_unsafe_takeover().
> +		 */
> +		if (!nbcon_is_unsafe_usable(con, flags))
>  			continue;

The above function pretends that an unsafe takeover is enabled.


>  		allow_unsafe_takeover = nbcon_allow_unsafe_takeover();

Here we get the information whether it is actually allowed.

> +		/*
> +		 * Since nbcon_is_unsafe_usable() was used, ensure @con does
> +		 * not have an unsafe write_atomic() if this context expects
> +		 * safe printing.
> +		 */
> +		if ((flags & CON_NBCON_ATOMIC_UNSAFE) && !allow_unsafe_takeover)
> +			continue;

Here we duplicate the check from __console_is_usable() using the updated
information.

It is a bit hairy. It might be better to use the up-to-date
information in console_is_usable*().

I suggest to rename __console_is_usable() -> console_is_usable_unsafe().
It would take 4 parameters, including @allow_unsafe_takeover.

It would be used to implement the most commonly used variant:

/* Variant used where the unsafe_takeover is never allowed. */
static inline bool console_is_usable(struct console *con, short flags, bool use_atomic)
{
	return console_is_usable_unsafe(con, flags, use_atomic, false);
}

And this would be the only location where the longer variant is needed:

		/* unsafe_takeover might be allowed in this code path. */
		allow_unsafe_takeover = nbcon_allow_unsafe_takeover();
		if (!nbcon_is_usable_unsafe(con, flags, true, allow_unsafe_takeover))
			continue;

> +
>  		if (nbcon_seq_read(con) >= stop_seq)
>  			continue;

Note that I have not seen the rest of the patchset yet. It is possible
that I miss something.

Best Regards,
Petr
