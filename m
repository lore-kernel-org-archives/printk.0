Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795602165;
	b=MLbkd5e40bfXjk0ILnjV9J3QJjdmAAf+XLxEeJMJZ/m+YhEF+ncnQ+DjOkzrbeWzqfFv
	 v5qlYxj2b47h7Q+4gEqGh+IRhHtdL9LFrC38yy9KnrBz9cGhQ7vWhzbSB9Z3siLsfg5wr
	 ESXUl2mdnbfspLCXAOtyCWAVh26mou2mlxl6FJslQVJg7hNLxRoudw1F0otRmeljSXeKD
	 DKaXb/Vuk7s9LdDJVCUIiu25rw7aO/25pPZAyVCCZqItJVzfVGXSw1dU0oZwFnocuGbMH
	 cz9wcJ4rmQHeH+fjRNuWqT2+SD/x3OJx7YnfwoanChiqnhMSuve1iONQeZUyv5tze5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ijkPT1gsMM8wRBmH+8prLgdVJMEbcnJW1LjlDQCmSt8=;
	b=PCt87shobAhLHpYsbWBO9Skz8FBYgQSlqy50ZbHvF1v/pym97ZrXoeQUoY/Xj0+3TiNa
	 bng/U57k32nnWDwBAzWRSm1EaBvlE0DrYmPHJs/R9x23sPeAV21EOIv9AoySiVrVwjeZR
	 TdDRHCpcL3vYw+eoBMAId7oastAbyeM0drAhT384Xr1ubUYAJqyuf/R3S2AmBhW01IcoB
	 WRHJYuoGsMkEKpU/m1br6iapkTrkD8emxn2+/+Vyd0nxzS3y1wasSpYuxf9bAxGdA3J7R
	 bsEizJy4obXB+8897H7YPnDDpd/0ydeF5rbmhDPYzRHaWou05UeofXWMFuWAGiAUSNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="MtK+SU9/";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7E7606A31E
	for <printk@lists.linux.dev>; Wed, 25 Nov 2026 10:22:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE7E7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MtK+SU9/
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so48942735e9.1
        for <printk@lists.linux.dev>; Wed, 25 Nov 2026 02:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795602163; x=1796206963; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ijkPT1gsMM8wRBmH+8prLgdVJMEbcnJW1LjlDQCmSt8=;
        b=MtK+SU9/rQxj8L6W+8fXb5oIfLctNRSOzw7O/z7dZXSRfsQCOwO6VAXA4jHrmqf6zf
         Bbg3r/nCEYB0wVltO/N0KFQroMO58p4FAQKHdRTVrfxbQb6AXDTn1lrbYWEKIwOOmwzI
         9TJoaHbjmZFUKazeqfBEe8llP63tvPDi6gVN7VFXtiv7pLEuBbsEKcuCk4s25d3ZTmn0
         lKlYh/oQszgWemQPkSW08LaBPWuGPGFczoudbQeuAyCRXOEsRoi/j/d8YsS8zSxDSp+S
         V0ZkkjOeZ3WCBMWXIWQqO9VCDEW8nIutPqbkSvkDU50v7pETaT5uZvoY0+Fj2EdZA4/o
         Y+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795602163; x=1796206963;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ijkPT1gsMM8wRBmH+8prLgdVJMEbcnJW1LjlDQCmSt8=;
        b=QvWOwSNbu81/hT0UPYFxGBPf25mMeHQH3sde2iNl7VHPdMept3gCmM+P29ye2mp34q
         Lbkkf7PWVHRsEupAyy5D5oTwMBNSiulxekdF6iTQsqGL3Ae1y5w8qeFFLAnsyp7QHKrO
         XbrzTqHl4rTytjj/OxK/mxygCp2MI5vtG307wxQZLzTMS0TRjhi7+ELmy+xNVjXobK3R
         pDunDhDLZRIvZkZLCHuQknfRuk6QQgTlxg+UcYR5dS51+tkX8IcItrkqkvx+pZq1YxKr
         /gMxeb0kSTO8cAUNp5yX33+mzgl7Cnilmo83Re3PI6fV4b7lZ5TcQa9SiPntx4SIP2WF
         KUow==
X-Forwarded-Encrypted: i=1; AL+hErHfMfRU0gLFoVJBI3Pvah4fgRe37PNiKVglCYvkXTwa+qnWewTkXkVit37gZt4uYut+NMHoFWw=@lists.linux.dev
X-Gm-Message-State: APuU4Z94vT6z86XAwe92MBONkgqfYOktxfE8zAaVmBIDqpIwjKwDoeBL
	9vt73/LE+Rbe5JIoeaqU8Djwf0YmUNl5QJfOL4pEqsUED6jbViYVMxf+VzAhBc5Jvs0=
X-Gm-Gg: AZFdTZeecyUrmkibZiFAoP3G9P5XVWZ3bGyN6B+qZyNmCT6OspHZ9hWT34jeI19ioJk
	U0K3Dt1sw0TqK+U/ZKOU3HqPUXT8O8Kkzm+e5fue1juoBzf/O8d1J1lP+Mk9HZhxwlWMyxdbqpH
	0CPqD/xJ7b5RQ+UpfV62QwrWL+gJf3vzgZjLyr/tYfn/Cly2ilThDy6NUOUPvXFk0TzdZM8Qgdm
	mUFFf/Ef852Cuf8O1Qg0AN3ZMH3xojIHCJjGAqDcZfJR+1fx5o6ZmkOaoK4PlMKwWgRarWWK8+W
	uxnlnBAmMCAxURd+PBFX+USl1OSD8obw6siPKuc4bhe2T0SPpmnqbKWsq90DEQlzEdqcC+8Jivy
	AjGu3jNat7uq1g/xd5K+qry4UyS6yrDARuxuG0fRq0W86UZdy0Vf+PhEPbJngflIt1szCd5Roys
	iwwwlUZtDkMvUDlT2MgK3Tzn50zM5oT8rPJaT7uICoK9o31EupokaRt2mk42w4Q0JPAC/+F8soD
	UOoQg5asJZG0jgQMptZwOE2mpOB0jroPAeWCAveJ9/gWAiwVMtZzVM6qCLzhAcEblKCw/eayUZj
	QnpIQ+58DPs7RMg0wcN1h+ERC90aoMwI8xTPTQnFxOpFxA==
X-Received: by 2002:a05:600c:1548:b0:4bb:7347:d5df with SMTP id 5b1f17b1804b1-4bb88814405mr368785105e9.13.1795602163096;
        Wed, 25 Nov 2026 02:22:43 -0800 (PST)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm526548365e9.2.2026.11.25.02.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:22:42 -0800 (PST)
Date: Wed, 25 Nov 2026 11:22:40 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>, printk@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH printk v4 5/8] printk: nbcon: Expand unsafe takeover
 check for general unsafe
Message-ID: <awa28PGg8L4rEDha@pathway.suse.cz>
References: <20261121163557.963029-1-john.ogness@linutronix.de>
 <20261121163557.963029-6-john.ogness@linutronix.de>
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
In-Reply-To: <20261121163557.963029-6-john.ogness@linutronix.de>

On Sat 2026-11-21 17:41:53, John Ogness wrote:
> Currently nbcon_allow_unsafe_takeover() is identifying if hostile
> takeovers are permitted.
> 
> In order to support unsafe flush policies for CON_NBCON_ATOMIC_UNSAFE,
> there needs to be a distinction between atomic flushing using an
> unsafe implementation or atomic flushing via hostile takeover. The
> former could be allowed in non-panic, whereas the latter is only
> allowed on the panic CPU.
> 
> Rename nbcon_allow_unsafe_takeover() to nbcon_allow_unsafe() and
> change its purpose to identify if unsafe console printing (in general)
> is allowed. If yes, hostile takeover can be allowed when on the panic
> CPU.
> 
> The comments for the WARN verifying no hostile takeover attempts
> during non-panic have been expanded. The detailed description will
> hopefully remind us of the necessity of restricting hostile takeovers
> to the panic CPU.
> 
> This opens the door for unsafe flushing (with safe ownership) for
> non-panic situations.
> 
> No functional change.
> 
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -1682,24 +1689,31 @@ static void __nbcon_atomic_flush_pending(enum pr_flush_reason reason, u64 stop_s
>  		/*
>  		 * Using variant of console_is_usable() to include consoles
>  		 * with unsafe write_atomic() implementations. They might be
> -		 * allowed depending on nbcon_allow_unsafe_takeover().
> +		 * allowed depending on nbcon_allow_unsafe().
>  		 */
>  		if (!nbcon_is_unsafe_usable(con, flags))
>  			continue;
>  
> -		allow_unsafe_takeover = nbcon_allow_unsafe_takeover(con, reason);
> +		allow_unsafe = nbcon_allow_unsafe(con, reason);
>  
>  		/*
>  		 * Since nbcon_is_unsafe_usable() was used, ensure @con does
>  		 * not have an unsafe write_atomic() if this context expects
>  		 * safe printing.
>  		 */
> -		if ((flags & CON_NBCON_ATOMIC_UNSAFE) && !allow_unsafe_takeover)
> +		if ((flags & CON_NBCON_ATOMIC_UNSAFE) && !allow_unsafe)
>  			continue;
>  
>  		if (nbcon_seq_read(con) >= stop_seq)
>  			continue;
>  
> +		/*
> +		 * Even if unsafe console printing is allowed, being able to
> +		 * perform a hostile takeover additionally requires this CPU
> +		 * to be in panic.
> +		 */
> +		allow_unsafe_takeover = allow_unsafe && panic_on_this_cpu();

I was a bit confused by this. Also I think that it is error prone. For
example, it allows to use the unsafe_takeover for
CON_NBCON_ATOMIC_UNSAFE consoles anywhere in panic(). But it should
be allowed only for the final nbcon_atomic_flush_unsafe(PR_FLUSH_HANG).

We should make this decision on a single place. I suggest to rename
nbcon_allow_unsafe_takeover() to nbcon_check_unsafe() and pass
*allow_unsafe_takeover as a parameter. I mean something like:

/**
 * nbcon_check_unsafe - Check if the console is safe or some unsafe handling
 *	is allowed for the given context and reason.
 *
 * @con:	The console to check
 * @reason:	The reason for the unsafe console printing
 * @allow_unsafe_takeover: Decision whether unsafe_takeover is allowed (output)
 *
 * The function decides when either an unsafe write_atomic() callback is
 * allowed or when all NBCON consoles are allowed to used the unsafe_takeover.
 *
 * Return:	True, when @con is either safe in all contexts or when it is
 *	allowed to perform unsafe console printing.
 *
 *	In addition. the @allow_unsafe_takeover variable is set to "true"
 *	when the console is allowed to perform the unsafe_takeover. Otherwise,
 *	the variable is set to "false".
 */
static bool nbcon_check_unsafe(struct console *con, enum pr_flush_reason reason,
			       bool *allow_unsafe_takeover)
{
	enum nbcon_prio prio = nbcon_get_default_prio();
	bool ret = false;

	*allow_unsafe_takeover = false;

	switch (reason) {
	case PR_FLUSH_RUNTIME:
		/* Never unsafe flush during runtime. */
		break;
	case PR_FLUSH_HANG:
		/* Always unsafe flush on panic hang. */
		if ((prio == NBCON_PRIO_PANIC) && panic_on_this_cpu()) {
			*allow_unsafe_takeover = true;
			ret = true;
		}
		break;
	}

	return ret;
}

Then we could use the following in __nbcon_atomic_flush_pending():

		if (!nbcon_check_unsafe(con, reason, &allow_unsafe_takeover))
			continue;

Note 1: We might want to refactor the function when we add the checks
	where to allow the unsafe write_atomic() callbacks.

Note 2: I thought about calling this directly in console_is_usable_unsafe().
	But it would require passing the *allow_unsafe_takeover as a
	parameter which is not needed in most situations when it is called
	via the console_is_usable() wrapper. But it still might make
	sense if we make the parameter optional (allow NULL).

> +

>  		nbcon_atomic_flush_pending_con(con, stop_seq, allow_unsafe_takeover);
>  	}
>  	console_srcu_read_unlock(cookie);

Best Regards,
Petr
