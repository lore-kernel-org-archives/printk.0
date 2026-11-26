Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689930;
	b=OeKCm0Z3c4Ve3fVoLxjhJId1e1J+HmaxyvyXc6GktzwwSsMnQ9lJp+3lxzzuQKvf5DQM
	 m+ZsnOxXaaETc0KKDK2e1z6Wp7GVjxt2qSg2ysVnshP+TAuH6XkJzVpl2Goch3ITK0y5F
	 nz/A4VU3bN0N/Y9ATJF1+FE54d5aaxQQO2Fw+oRn7OWDfB4EpSUTVcA8OQRdvN+OxSOsy
	 bjt43mgi33hL1Y1/yWqyhykoCP8PoYmZzPT5ZJKulsSlQKAYlFdUSuFZGsjF+KwpbuHd2
	 YRJ388qUR/aVBBfvooGDnSHxBXNqz6BMDc5iYaP1lu9Rqc3laMdjuxd2JgoKR37lZbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689930;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=R8UyDfQ0H68l0eyd2tMpBX4tHUBaVC1a2+t+bAaJl4A=;
	b=ReUtwA0UOHgqu3Lmz+MfgJDVsPIvvVe374QLeM5qia7FsLBTiPxVAhAj0zPDjK+CFEkj
	 ErlETeSKJIIH3aslBD5utaN05LA0Bt5CbkYY3GtCBhh6bAp/z5R9kcD3d7QSBB/h31SAo
	 VJHPjrV/OGz3dhn1/84Hm/E7xiE6AGGWB6I1HrQX0ONjBBmISVDVsRldBZ96TbppmVFgV
	 aMR73YZT7KiHSA266RLKzTzXHpJg6LcjgvCqDZQbuRoLuQbE2eyF0hL5oES5aS/7gCB9y
	 vXjFnWgQo78MK5YA1VKdnZy86WKvIbtTiAOhsX/aEy5pPazU8MVn2AGxrJkyt+qkE4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=T4eMv+6E;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="KkqwJPf/";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EEF606A31C
	for <printk@lists.linux.dev>; Thu, 26 Nov 2026 10:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2EEF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=T4eMv+6E;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=KkqwJPf/
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795689927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R8UyDfQ0H68l0eyd2tMpBX4tHUBaVC1a2+t+bAaJl4A=;
	b=T4eMv+6E42r6Qt0HQVh5EUDbuKM8HS2BZ3vZTfjYNqhdXbyA4xxrBVTGVoQ8857qa51Mks
	3u9nqUaGQhcmwh3qt4IAeRbkSLoV72y2dBnT+v1gjzIUrEjltYG4JJZ93xtN5GUVz9dOiz
	BW4BCWtvsFHA3+ISNkbQHdN5E9Nm4b5QGbAoziX3ML77TFUDsyX4ScanVPL2NGA9tykFUq
	MNFR+2VzqaeXb2DcHW93S2NkBTvLtXrt03os1j4A7GMNCtORecxaij75zY3cb/a+iIBLaY
	flhpx1SChf669HYDvhA/k5i9bCVZHg/ZShI8TJG1hE8eGHkMZNz21GOjAQ6+3A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795689927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R8UyDfQ0H68l0eyd2tMpBX4tHUBaVC1a2+t+bAaJl4A=;
	b=KkqwJPf/xtZmz5qaBe7iCRBoTpxLNAna1Fee7KlKBGT+pjmR/x76aDBxPHmaPDzvSmy1Tq
	FkAOc29zsGQ8UQDg==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Ryan Roberts <ryan.roberts@arm.com>, Breno Leitao
 <leitao@debian.org>, printk@lists.linux.dev, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH printk v4 6/8] console: Support unsafe flushing for
 panic/emergency restarts
In-Reply-To: <awbqiycLbPPFU2N3@pathway.suse.cz>
References: <20261121163557.963029-1-john.ogness@linutronix.de>
 <20261121163557.963029-7-john.ogness@linutronix.de>
 <awbqiycLbPPFU2N3@pathway.suse.cz>
Date: Thu, 26 Nov 2026 11:51:27 +0106
Message-ID: <87bj7b7tx4.fsf@jogness.linutronix.de>
X-Mailing-List: printk@lists.linux.dev
List-Id: <printk.lists.linux.dev>
List-Post: <mailto:printk@lists.linux.dev>
List-Help: <mailto:printk+help@lists.linux.dev>
List-Subscribe: <mailto:printk+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:printk+unsubscribe@lists.linux.dev>
List-Owner: <mailto:printk+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On 2026-11-25, Petr Mladek <pmladek@suse.com> wrote:
> Many different flags are mixed in this function:
>
>     1. CON_NBCON_ATOMIC_UNSAFE from enum cons_flags
>     2. NBCON_PRIO_* from enum nbcon_prio
>     3. PR_FLUSH_* from enum pr_flush_reason
>     4. NBCON_*_FLUSH from enum nbcon_unsafe_flush_flags (flush policy)
>
> It is easy to get lost. I wonder if we could do better. ;-)
>
> Ad 1st: CON_NBCON_ATOMIC_UNSAFE is not ideal. But it is done. And
> 	I am not sure how to make it better.
>
> Ad 2nd: NBCON_PRIO matches nbcon_prio. It look good.
>
> Ad 3rd: PR_FLUSH is not that good. It would be better to
> 	emphasize that it is a "reason".
>
> 	I would prefer to use the longer PR_FLUSH_REASON_ prefix.
> 	It will be consistent with "enum pr_flush_reason" type name
> 	and more clear.

OK.

> Ad 4th: Both NBCON_*_FLUSH and enum nbcon_unsafe_flush_flags are far
> 	from clear. And they are not consistent. Sigh, it would be
> 	great to emphasize "unsafe", "flush" and "policy".
>
> 	I think about:
>
> 	enum nbcon_unsafe_flush_policy {
> 		NBCON_UFP_PANIC_RESTART	= BIT(0),
> 		NBCON_UFP_EMERGENCY_RESTART = BIT(1),
> 	};
>
> 	or maybe even better
>
> 	enum nbcon_unsafe_flush_policy {
> 		NBCON_UF_POLICY_PANIC_RESTART	= BIT(0),
> 		NBCON_UF_POLICY_EMERGENCY_RESTART = BIT(1),
> 	};

I am fine with the latter.

> 	plus use:
>
> 	struct console {
> 	[...]
> 		unsigned int		unsafe_flush_policy;

OK.

> 	and finally the local variable "uf_policy".

OK.

John
