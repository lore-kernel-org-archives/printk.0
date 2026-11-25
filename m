Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615376;
	b=QlIfsoHP5ZoWBoRBEwant/iInKOSeHbcoWSKS/F4MRNwCmxVc4QrVmUsAWQuFRwp3oTN
	 RqSca29yHdojiwICHmqXmdUME0eoLHrRKxBlk6jwdEPZXkSZfPEUyf0Ui/J/vDIKXuuDz
	 N6ZncjaUyrVFsEQXBCHlEJgDxKe8MpNBVlvtdMnUJoEC0ISEQggBOXBmnW12Rs10J7P6E
	 JXD56+YGHhnYfJK25jSDiwgceWPG2Flw1QJOunp4hAoQCL41WcV6hJAbNPft+kmdrPMPW
	 /iZuNFcfjGZnlzbUvJI99SVoznXArFK8d/I8E4Ty4r0eWY+G8va5NUR8BErW1TqFqIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=tHONq08nC4X9qMcp/4zGQtPWASfmcbRhLdusAHN+ZIw=;
	b=hxdmLC91kofE4GclgjcbwQJHfyr5k5pJi3qP1WfN7oe/qVNC8/v/e2lKthll7brVHQ82
	 JOAkJuQC+zCZOiNwcLjipVILqbhsOu5aJbjlE96uKl89jkV8qid5UQZJQayGz+pMzDOKq
	 fZfbA/70EJfBKSkeUappkmfKSHcZPvDpEpoE5YZLc/LoC1NMwCw5Ne7GgzKb2+ntNQ56m
	 vB7tGno1Zlij7DF/QXxYvCdC1Jhw6SxRfOwPKsq+12uhnHkg2ceMrNopkWNzrZj1Kxa0k
	 w3fwmoAeHeg6Zbovce50T0j1KFrToER37p16Fla8jRkK6tKA0oRpdhMXc710+zciH/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="GsxkiLt/";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E40606A321
	for <printk@lists.linux.dev>; Wed, 25 Nov 2026 14:02:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0E40606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GsxkiLt/
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so74952685e9.1
        for <printk@lists.linux.dev>; Wed, 25 Nov 2026 06:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795615374; x=1796220174; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tHONq08nC4X9qMcp/4zGQtPWASfmcbRhLdusAHN+ZIw=;
        b=GsxkiLt/XkfQnsW+6HHax5IqdEuDHkmBMxYGoPORVDFmcenbig1tOD+cf4JywarRLz
         1matsA70HGTenThl1PvRKCB2QIGDfwQdIVl/bsCXrK2I2kx3okmrnVG2Wb6Xv+ilxL8q
         gH4py4av0SsKxjWQTAXzrsqcRJSYap7sNKm4BdZ98j6LBM+M5nyapzAM6KzDcouQypy/
         6N23Y1L87rq1y7wMjJ3igkp2ya6AoFfrTkbNxJjjVUQiKbwe6aP8B8+DFXrsY8wOGgIJ
         +NMNeXMAk2ZBhWlsIWa2cXFJqu3qt6Eyk1IQUkEnBIbjbvv627abO5VrpHoQ+1G3UNVm
         wV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795615374; x=1796220174;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHONq08nC4X9qMcp/4zGQtPWASfmcbRhLdusAHN+ZIw=;
        b=w8JOVp0fqNM/VX6AamVl/2stbUW/wmX/VEBQvUE97L0ztSe38dcI+jQ35TQ+rE4A91
         okPg5AorkuBWCi9PIkF83vjJUZ4FYtrSs0ob97UhtiKLAjIITO8FDM0Q3PxGffmdo1RA
         pF/4+UQabnlY6ZE2maXocc9xXrwWBU3HS7KoWF+3YqyK3RHVOEqLW9+28s1vs9gb+qUB
         EFYjd2ZMBhAkYWlUgPEBjLQeopVOy3ifGUwbRrnq+5dB+0sPGR8TPPlanzLhQCdBfadp
         VuUQTqm3x9fxNWp+fJbWwUcfK75u8dNFEw49MCafGyumSQwC79/MMIG1x5ZtOLUeFVDz
         q7Iw==
X-Forwarded-Encrypted: i=1; AL+hErG4w4hEtWa0egqq5k5C/OKqoQ4Vi1uCitnnGovB6JO4/icXLdrYEs/vax//e2QPsXnMU8IfhLs=@lists.linux.dev
X-Gm-Message-State: APuU4Z9Hhf8YGiYkWL5PD3LyPwQ7fsuc49ghlLDR02dVBFzNNLE1VIGS
	ab96L7Nwd6zSVdYYxmawnOZau7ei00vq9568IEWbtvcfmHvUbDRiaRYYcpd+kGnbl3M=
X-Gm-Gg: AZFdTZexzJvvqE/goZ7bDH2qZ+HSNKwKCPAsZXuXsH611mm3/ma43E2A8vUJkkqS/rm
	tQtH4o6Z4WecQGiSBCmDot3QO7xCkFTVT0o8r2AyWSYWOb2GXMEiGMTOPTcpj+DijJzm9+hLy4q
	GlezCBPaKKYXtbCMSOHerTmikA07UvhHTJ133uyAy/KnDQoFWNDEz/leWCBkgQaBZc3mxB6sVoR
	kDaeQt/RZs5EwfbJHoJLMprYIFSx/ZxF6tuzPBAHVWJkfEiQSVu/VS6O2o9q6AYVzwgKaffxy/8
	g2Abv3vv4+R+FFXFLZkMp0RujGif1a1xU4yaEoYhgrJzUW8HWvuvttw3hXlD1/tHjK503pR1Hmh
	E4mWQMYQTpL1CH8ERNYUBwGVFwnWODFwd/zTTs+nIjflIX/3o5UzUcwQn7rz27ggbipNucsBRzv
	HVE7NxjXshcfvwcFykJfeta0GawgXxWMUIszC94Nxe7mb16MlXrMUn0aIBOoaeVaVxsdXzLPolo
	A5J1+nzh4Nze7O7tYc3iWUfZWpSO28wlKtG+RsxK7dxApjdEzjNrXxcXgT+Cbm3YOY2al0gkDF3
	q3hPd1dvNvDhWI94FXrHUInjK4s/1+EEYLHydEthZ3fW94U=
X-Received: by 2002:a05:600c:4e94:b0:4a1:d766:758 with SMTP id 5b1f17b1804b1-4bb86161de1mr460541005e9.16.1795615373893;
        Wed, 25 Nov 2026 06:02:53 -0800 (PST)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm715759415e9.13.2026.11.25.06.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:02:53 -0800 (PST)
Date: Wed, 25 Nov 2026 15:02:51 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>, printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH printk v4 6/8] console: Support unsafe flushing for
 panic/emergency restarts
Message-ID: <awbqiycLbPPFU2N3@pathway.suse.cz>
References: <20261121163557.963029-1-john.ogness@linutronix.de>
 <20261121163557.963029-7-john.ogness@linutronix.de>
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
In-Reply-To: <20261121163557.963029-7-john.ogness@linutronix.de>

On Sat 2026-11-21 17:41:54, John Ogness wrote:
> Introduce a new nbcon-specific console field @allow_unsafe_policy
> to store the unsafe flush policies for a console. The policies are
> represented by bits, specified by enum nbcon_unsafe_flush_flags.
> 
> Define unsafe flush policies for:
> 
> 	panic+restart: This is for kexec and reboot from panic.
> 
> 	emergency+restart: This is for emergency_restart() when in
> 				the emergency state.
> 
> Define a new flush type:
> 
> 	PR_FLUSH_RESTART: For flushing before kexec and reboot.
> 
> Implement the policy check within nbcon_allow_unsafe_takeover().
> 
> No functional change.
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> ---
>  include/linux/console.h | 20 ++++++++++++++++++++
>  include/linux/printk.h  |  3 +++
>  kernel/printk/nbcon.c   |  7 +++++++
>  3 files changed, 30 insertions(+)
> 
> diff --git a/include/linux/console.h b/include/linux/console.h
> index 227a7cf296f60..1afeb90692395 100644
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -194,6 +194,23 @@ enum cons_flags {
>  	CON_NBCON_ATOMIC_UNSAFE	= BIT(9),
>  };
>  
> +/**
> + * enum nbcon_unsafe_flush_flags - Unsafe atomic flush policy flags
> + * @NBCON_PANIC_RESTART_FLUSH:		In panic, unsafe flush before kexec
> + *						or reboot.
> + * @NBCON_EMERGENCY_RESTART_FLUSH:	Unsafe flush before emergency restart.
> + *
> + * NBCON unsafe atomic flushing always occurs at the end of panic() before
> + * the kernel enters an infinite loop. Users may choose to perform unsafe
> + * flushing in additional scenarios where the current kernel is ending in
> + * order to increase the chances of seeing console messages, even if it is
> + * not safe to do so.
> + */
> +enum nbcon_unsafe_flush_flags {
> +	NBCON_PANIC_RESTART_FLUSH	= BIT(0),
> +	NBCON_EMERGENCY_RESTART_FLUSH	= BIT(1),
> +};
> 
>  /**
>   * struct nbcon_state - console state for nbcon consoles
>   * @atom:	Compound of the state fields for atomic operations
> @@ -326,6 +343,7 @@ struct nbcon_write_context {
>   * @data:		Driver private data
>   * @node:		hlist node for the console list
>   *
> + * @allow_unsafe_policy: Unsafe atomic flush policy. See nbcon_unsafe_flush_flags
>   * @nbcon_state:	State for nbcon consoles
>   * @nbcon_seq:		Sequence number of the next record for nbcon to print
>   * @nbcon_device_ctxt:	Context available for non-printing operations
> @@ -461,6 +479,8 @@ struct console {
>  	 */
>  	void (*device_unlock)(struct console *con, unsigned long flags);
>  
> +	unsigned int		allow_unsafe_policy;
> +
>  	atomic_t		__private nbcon_state;
>  	atomic_long_t		__private nbcon_seq;
>  	struct nbcon_context	__private nbcon_device_ctxt;
> diff --git a/include/linux/printk.h b/include/linux/printk.h
> index 68cf51db5f0ea..267a0a6fd23cf 100644
> --- a/include/linux/printk.h
> +++ b/include/linux/printk.h
> @@ -148,6 +148,8 @@ struct dev_printk_info;
>  /**
>   * enum pr_flush_reason - Reason for a flush
>   * @PR_FLUSH_RUNTIME:	A flush while the kernel is running
> + * @PR_FLUSH_RESTART:	The kernel is ending, but another instance should
> + *			follow (reboot, kexec)
>   * @PR_FLUSH_HANG:	The kernel is ending and will enter an infinite loop
>   *
>   * Flush reasons are used to determine if unsafe atomic flushing should be
> @@ -155,6 +157,7 @@ struct dev_printk_info;
>   */
>  enum pr_flush_reason {
>  	PR_FLUSH_RUNTIME,
> +	PR_FLUSH_RESTART,
>  	PR_FLUSH_HANG,
>  };
>  
> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> index 8b7483bd57188..f1789cfbd8b57 100644
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -1471,12 +1471,19 @@ enum nbcon_prio nbcon_get_default_prio(void)
>  static bool nbcon_allow_unsafe(struct console *con, enum pr_flush_reason reason)
>  {
>  	enum nbcon_prio prio = nbcon_get_default_prio();
> +	int unsafe_policy = con->allow_unsafe_policy;
>  	bool allow = false;
>  
>  	switch (reason) {
>  	case PR_FLUSH_RUNTIME:
>  		/* Never unsafe flush during runtime. */
>  		break;
> +	case PR_FLUSH_RESTART:
> +		if (prio == NBCON_PRIO_PANIC)
> +			allow = (unsafe_policy & NBCON_PANIC_RESTART_FLUSH);
> +		else if (prio == NBCON_PRIO_EMERGENCY)
> +			allow = (unsafe_policy & NBCON_EMERGENCY_RESTART_FLUSH);
> +		break;

Many different flags are mixed in this function:

    1. CON_NBCON_ATOMIC_UNSAFE from enum cons_flags
    2. NBCON_PRIO_* from enum nbcon_prio
    3. PR_FLUSH_* from enum pr_flush_reason
    4. NBCON_*_FLUSH from enum nbcon_unsafe_flush_flags (flush policy)
7
It is easy to get lost. I wonder if we could do better. ;-)

Ad 1st: CON_NBCON_ATOMIC_UNSAFE is not ideal. But it is done. And
	I am not sure how to make it better.

Ad 2nd: NBCON_PRIO matches nbcon_prio. It look good.

Ad 3rd: PR_FLUSH is not that good. It would be better to
	emphasize that it is a "reason".

	I would prefer to use the longer PR_FLUSH_REASON_ prefix.
	It will be consistent with "enum pr_flush_reason" type name
	and more clear.


Ad 4th: Both NBCON_*_FLUSH and enum nbcon_unsafe_flush_flags are far
	from clear. And they are not consistent. Sigh, it would be
	great to emphasize "unsafe", "flush" and "policy".

	I think about:

	enum nbcon_unsafe_flush_policy {
		NBCON_UFP_PANIC_RESTART	= BIT(0),
		NBCON_UFP_EMERGENCY_RESTART = BIT(1),
	};

	or maybe even better

	enum nbcon_unsafe_flush_policy {
		NBCON_UF_POLICY_PANIC_RESTART	= BIT(0),
		NBCON_UF_POLICY_EMERGENCY_RESTART = BIT(1),
	};

	plus use:

	struct console {
	[...]
		unsigned int		unsafe_flush_policy;
	[...]
	}

	and finally the local variable "uf_policy".

};

What do you think, please?

Otherwise, the patch looks good. Note that we do not need to check
here panic_on_this_cpu() because NBCON_PRIO_PANIC is used only on
the panic_cpu.

Best Regards,
Petr

>  	case PR_FLUSH_HANG:
>  		/* Always unsafe flush on panic hang. */
>  		allow = (prio == NBCON_PRIO_PANIC);
> -- 
> 2.47.3

>  LocalWords:  PRIO
