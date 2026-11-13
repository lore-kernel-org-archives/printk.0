Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586656;
	b=0zkOpW7UEaXnKVNDBoZpAOIq1cO6DscniHKIB5ZEfJ+JqszbFlGV1mLpBkPXm4x0Tpwb
	 RrLByATkJjhissSGcEXsL26tqTuHUW9DtZ8Prda4hvsyblhA9oZH8WWGvxikcDH3yyVec
	 lzOt6Uo+UOHWNV+EsCfxr3OfMu+xG0mvk+GWRpiiT4gZzF4KPNobGh3XnsQV1wfcMWREE
	 4YUKQuojpQB2bFXOZs9UHMgoCPTi8DEuaUM+V61He1yRGhSV+PMw5WVZQFeA6lb1zEXfY
	 YGFcnNyVWgkM9k4GxGPMkBMrvhdjPgjaHzj2qrO8sZqcrGQ3xYC4zG/y+bZ3IosHpIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=b3U6MCdDzdZgylBNSuWirvYPWE1+TH01NTWEY/nVWgI=;
	b=mflPSxa+3AQSyk8E9phGxvecbPU7rnG3t1EBiCwwX1X8jPSw2v4Y5EA416Zv/m8fF694
	 V0d013wnrzRBYE9LVjChxvElSf0SrbLcJrSDPU/nEwJqmqE/v5CtJNOKcLF9/ntXRqcn+
	 JzWUqJXKPbEvBB97Tc7MPpOVyj6dCTQhNfTMVTxP7A+vO+8k0rLnADDiNJUtSzoiAFmwM
	 1Of1de8OKL9SzxNzlf5T+E/6NG/AiKu2kh73Xl8kCxB6CqrUEPj3BY9k4LHmLKDsUNi8p
	 1P07iG/aqKuHMLeFLldLW3YrZIkGX/bm24HZJihsXIGDAxfbL45aYtCUPKtAnVrzCww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KhKA6UaR;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A77606AE3E
	for <printk@lists.linux.dev>; Fri, 13 Nov 2026 16:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1A77606AE3E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KhKA6UaR
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c445c95d553so218315766b.1
        for <printk@lists.linux.dev>; Fri, 13 Nov 2026 08:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794586653; x=1795191453; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b3U6MCdDzdZgylBNSuWirvYPWE1+TH01NTWEY/nVWgI=;
        b=KhKA6UaRYSK7LkuYJx47JnFg64PfL110s2qj65L4BfPpRUfsc0ohTXqICFtlNQlBO7
         X47LUAOvCOFVAzeCEIHzUJYVrvOytHI91uOaVEVE0pmGRP/OPXSNsj9Rh1NEMvr0xlZC
         4yWtc1fAXjfT/TyYVIe04AJlshsOWKORJTctWvvZKwIFxQxR5LCRvpe2M3Hc148FwJ+U
         /XtKDqaW/kB3kgkdEbekDhUAROMlgKncI79HuElh/msyDY8DPM2wUL1DsizbZxgW6TG6
         ZFceKUYvz5vsb5xU7ziEqClQaMI9eWARRxE+pZA6BA4SoDpBC5HWIKpp7+8yY6OX2tYu
         +PnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586653; x=1795191453;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b3U6MCdDzdZgylBNSuWirvYPWE1+TH01NTWEY/nVWgI=;
        b=u9F9rTNGx5vKimCuj45DkwMHKjWXKO+xKhjTAc6HkaM+PD0JpmDFdb6vwMaqIpDNjj
         1pFn5SIjDxiuCVf+uEc1q/CaJpLPET6rOI28LHRYsnXbLfxfFFItDvbiD3oXtOloe+45
         abjxtKsLTS/fQciHbCxDstIg3kWfHyiOY/MphLfkJdRtgXx9LCHE/bUnT++wJXPDMBHJ
         y/5zmoV1bP1XVCqqvQc3y1Ha4SSrJ8B/IvSIa0DetF4h3heHIj1iH/81vc4W94yLj3+0
         pRANzag07CKhmkzPeUGLKRoTO09ML926PJ5Ph/jRyoAHpQreHuTsq1WLzGdAPvsyvm9n
         Iw5w==
X-Forwarded-Encrypted: i=1; AL+hErHoaUG+B1Fpx+4dAUqL5OvcON9AlH27V4B0HhiBICV6BOEDW587aAakNZ47HyQFg6xfkdyf1DA=@lists.linux.dev
X-Gm-Message-State: APuU4Z9jf+ZSsC3BuoM8DtBbzj3GeEhq2npdljKb2Uitp/nN35neW9Ys
	levgmDi3i7O5SOZRvGQzF9OQNvOXOiPMRJyC37cM7xgWE4bzSSnSrSMprHM3CJUzjBM=
X-Gm-Gg: AYBFou3xM3DmkWFy4LcSCHZ78C0P/6rVDh++ePOp/5kzUFh3t2CeTWsN5+ibIwDWoQC
	YaBBDN8TZl/ppV09UF1oZjB8bekwwVpX65D5jQ6kvPT+A2qJ4L6g8m8BNiopXs36/wbQd7KAibI
	KbmOP6xspG0s3UVPQDu4BgigFS4s2wCuxCwcbBM4mGGnFY3JovXPeAc9xuQ4vyWVXvozIet5oZ7
	zocCa2Oa3WbEdBzY3pwcDuuB9NqK7EyzvmQV2PWR6xyrRkDRVnX3DYzQ4VNfH98X0W8mQk88d8B
	d6kMo5H2huXTb9zyRKJ3rPJBxYA/EiaqXzyRvi459ZjX9GHPk+OmrnHHpm/dFtJ7WR3y7G10bxI
	0V0MHpV/sHV/b/FO8ZMpyiIsejq0gwiKumC73D8zYE0xtC8Fx2bmgG1/zp7vNeQL5mJL6YYOFCi
	aNWhmMFkMAKjTPrMu6DjpyanKOGZJsT8spp8qMB+Gv1f6UC8dlJHIYAIr6Xqw2+OgNM0Nv8RwkO
	Ak4FpJzfgsfq8lqVtMd0bA30xN+DBEDSTyToQrvYnr45TPXp5YfuctB+1GTbnw6sFeXtymlEVUX
	MR0O7iejLyVmzPcZRMGsJPJANJuldgM=
X-Received: by 2002:a17:907:3f02:b0:c4c:eb17:3da with SMTP id a640c23a62f3a-c509636a83emr347881466b.22.1794586653209;
        Fri, 13 Nov 2026 08:17:33 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b6091dsm118589566b.57.2026.11.13.08.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:17:31 -0800 (PST)
Date: Fri, 13 Nov 2026 17:17:29 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>, printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH printk v2 2/6] console: Introduce unsafe flush policy
 flags
Message-ID: <avc4GVqYdpL8r3Un@pathway.suse.cz>
References: <20261111181942.593695-1-john.ogness@linutronix.de>
 <20261111181942.593695-3-john.ogness@linutronix.de>
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
In-Reply-To: <20261111181942.593695-3-john.ogness@linutronix.de>

On Wed 2026-11-11 19:25:18, John Ogness wrote:
> Prepare for per-console atomic flushing policies by introducing a
> new nbcon-specific console field @unsafe_flush_flags to store the
> unsafe flush policies for a console. The policies are represented
> by bits, specified by enum nbcon_unsafe_flush_flags.
> 
> Currently it is expected that any @unsafe_flush_flags bits are set
> prior to console registration and do not change while registered.
> 
> No functional change.
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> ---
>  include/linux/console.h | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/include/linux/console.h b/include/linux/console.h
> index 06d01f1743512..beb1ee04535b7 100644
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -194,6 +194,29 @@ enum cons_flags {
>  	CON_NBCON_ATOMIC_UNSAFE	= BIT(9),
>  };
>  
> +/**
> + * enum nbcon_unsafe_flush_flags - Unsafe atomic flush policy flags
> + * @NBCON_PANIC_FLUSH:		In panic, unsafe flush before kexec or reboot.
> + * @NBCON_PANIC_PRINTK:		In panic, unsafe flush on each printk().

Do we need to distinguish between flush in printk() and an explicit flush?

IMHO, there is no reason. We usually call the explicit flush because
we want to trigger it. But printk(), called in the same context,
should trigger/do it as well.

> + * @NBCON_NORMAL_NOTHREAD:	During normal operation, when printing
> + *				kthreads are unreliable or have been shutdown,
> + *				unsafe flush on each printk() or on explicit
> + *				flushing.

Do we need to distinguish between panic and non-panic paths when the
kthreads do not work?

IMHO, this is more about that the system is going down and the
kthreads do not work.

Also what about emergency context when the system is about
to continue?

> + * @NBCON_KDB:			Unsafe flush kdb output.

OK, let's assume that we want to set a policy where we allow
the unsafe takeover in the following contexts:

  NBCON_ALLOW_UNSAFE_NEVER
  NBCON_ALLOW_UNSAFE_RESTART
  NBCON_ALLOW_UNSAFE_EMERGENCY
  NBCON_ALLOW_UNSAFE_KDB

, where

  + NEVER might actually allow it when explicitely enabled in
    nbcon_panic_flush_unsafe(). The word "never" just has a simple
    semantic in the context of the other values

  + RESTART would allow the unsafe takeover in printk()/flush()
    when the system is doing halt/reboot/crash_kexec...

  + EMERGENCY would allow it even in NBCON_PRIO_EMERGENCY context.

  + KDB would allow it in KDB context


And I would get the context the following way:

enum nbcon_allow_unsafe get_nbcon_allow_unsafe_request(void)
{
	enum nbcon_prio prio;

/*
	 * The kdb check is copied from vprintk() implementation.
	 * We should put it into a helper.
	 */
#ifdef CONFIG_KGDB_KDB
       /* Allow to pass printk() to kdb but avoid a recursion. */
	if (unlikely(kdb_trap_printk && kdb_printf_cpu < 0))
		return NBCON_ALLOW_UNSAFE_KDB;
#endif

	prio = nbcon_get_default_prio();

	/* FIXME: What about SYSTEM_SUSPEND?
	if (prio == NBCON_PRIO_PANIC || system_state > SYSTEM_RUNNING)
		return NBCON_ALLOW_UNSAFE_RESTART;

	if (prio == NBCON_PRIO_EMERGENCY)
		return NBCON_ALLOW_UNSAFE_EMERGENCY;

	return NBCON_ALLOW_UNSAFE_NEVER;
}

IMHO, this better fits the existing terminology and design.
And it should be much easier to understand by developers
and users.

+ *
> + * NBCON unsafe atomic flushing always occurs at the end of panic() before
> + * the kernel enters an infinite loop. Users may choose to perform unsafe
> + * flushing in additional scenarios where the current kernel is ending in
> + * order to increase the chances of seeing console messages, even if it is
> + * not safe to do so.
> + */
> +enum nbcon_unsafe_flush_flags {
> +	NBCON_PANIC_FLUSH	= BIT(0),
> +	NBCON_PANIC_PRINTK	= BIT(1),
> +	NBCON_NORMAL_NOTHREAD	= BIT(2),
> +	NBCON_KDB		= BIT(3),
> +};
> +
>  /**
>   * struct nbcon_state - console state for nbcon consoles
>   * @atom:	Compound of the state fields for atomic operations
> @@ -326,6 +349,7 @@ struct nbcon_write_context {
>   * @data:		Driver private data
>   * @node:		hlist node for the console list
>   *
> + * @unsafe_flush_flags:	Unsafe atomic flush policy. See enum nbcon_unsafe_flush_flags
>   * @nbcon_state:	State for nbcon consoles
>   * @nbcon_seq:		Sequence number of the next record for nbcon to print
>   * @nbcon_device_ctxt:	Context available for non-printing operations
> @@ -461,6 +485,8 @@ struct console {
>  	 */
>  	void (*device_unlock)(struct console *con, unsigned long flags);
>  
> +	unsigned int		unsafe_flush_flags;

I would call it:

	unsigned int		allow_unsafe_policy;

> +
>  	atomic_t		__private nbcon_state;
>  	atomic_long_t		__private nbcon_seq;
>  	struct nbcon_context	__private nbcon_device_ctxt;

And the net console would get initialized to:

	.allow_unsafe_policy = NBCON_ALLOW_UNSAFE_RESTART | NBCON_ALLOW_UNSAFE_KDB;


And nbcon_allow_unsafe_takeover would get implemented as:

static bool nbcon_allow_unsafe_takeover(struct console *con)
{
	allow_unsafe_request = get_nbcon_allow_unsafe();

	if (con->allow_unsafe_policy & get_nbcon_allow_usafe_request())
		return true;

	return panic_nbcon_allow_unsafe_takeover;
}

What do you think, please?

Best Regards,
Petr
