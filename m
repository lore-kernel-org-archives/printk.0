Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793288576;
	b=LdJjGkMHa12chZj9XHwF/QoejQMV0YFz9yNSdeAyZqbgBW/t8PiU1FKesyQ92z/xfojo
	 NE0wAkUokj2Wc1F5++WDIhaIXRekzzOCBn3wypb3nMhGD85n3c7hqwHmGVSSEQn8STHef
	 Ncouxf247ujdSVvsbqC6njvT7TtGiKN+lmCcqiEPI1OzKxEws0/K8BDBmbJP63d0oWp96
	 50nHzmp/avbY78ijg3SH84w9YyU63+ZO6qH5RbMeDfPeju0ImHo7DAOZSJ+7jeUzWBHV2
	 HlxUH1ZCDFqh3Oq+7u+D4M+xyuzAiBffj6fAU/PEPM03ME8i3JidMOQbSxY9ksMz7eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793288576;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=L5D86BXNnNkH5tFHqH3VjPCbsL8RXaLh8X9LuOfrSFk=;
	b=HglSUQWReALcCtpuFg47R34D4I2d4qXNLsX6/o2RoAkGTeRM46339ghDKBcL7zpcSKpM
	 4WKJP3puOo0H4F2jkCc5H/milcfGDtUv2IiEgNuLibds1h+yjb1v9VgqkGnK12pk2UCWs
	 ihgXADSC7mmbQB46LjgtXEelGYZPiEj1RrAdwce1kzjJy6FH5tOqdMzXPjBxmKRbctSrX
	 jb+g2FfFRDvRD0uJPqDWOI1m8fmegHanx/MmbGtimzB79J+IQoF+DpJ9mdGAItwJmGR8I
	 HE8v4y/s6rl6kkhZwdqD4Wyme4WuZ/kU7//sTI2me9Ibuwmq8a2YGY4Nv/ikjslGZ3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="1mI/KKbJ";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=9wAXUyVG;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C7E606A31C
	for <printk@lists.linux.dev>; Thu, 29 Oct 2026 15:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3C7E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=1mI/KKbJ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=9wAXUyVG
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793288573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L5D86BXNnNkH5tFHqH3VjPCbsL8RXaLh8X9LuOfrSFk=;
	b=1mI/KKbJifBl0xlBKIAJQI5uhaZN8dMQjYjmpybz0Hs+oTnviJ/TbplPRsxaQPtNHKYWjn
	Dr2ntFgMmAwHvKY9YHBIvrSX7RAPHF9Jup7Q/M7wDba5u4N8E1t2+4R1o1/wkWbjlnRI9l
	NiRLsga938a3UTCo62NJ7YUZ72Qm69KLMGOYqrYNudGadaYU+ESXVsFaaOuq/rxLGu96rn
	sKbt7UPliR6n8/rfOTbpegPn62L+3sgK/InfSW160zm63yE9ywTOAROxNAX54RvqZn8EHr
	sH0RrqKYclePkmERALeKF3o3TnMv62pTJeySd8QVZSdxRTedFBlg78vh+rn85g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793288573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L5D86BXNnNkH5tFHqH3VjPCbsL8RXaLh8X9LuOfrSFk=;
	b=9wAXUyVGxrwz9T1YeevfYK4dIfmJb0V0hUFOvHAOoIkphgQV4b7u6m6Gzy3VaQ7oc6aAMd
	RSFkcorc/oIJIVCA==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Derek Barbosa <debarbos@redhat.com>,
 printk@lists.linux.dev, linux-kernel@vger.kernel.org, Sashiko
 <sashiko-bot@kernel.org>
Subject: Re: [PATCH printk] printk: Avoid multiple unregistration in
 unregister_console_locked()
In-Reply-To: <20261029152454.638952-1-john.ogness@linutronix.de>
References: <20261029152454.638952-1-john.ogness@linutronix.de>
Date: Thu, 29 Oct 2026 16:48:53 +0106
Message-ID: <87y0bgwm0y.fsf@jogness.linutronix.de>
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

On 2026-10-29, Sashiko wrote:
>> @@ -4471,6 +4493,9 @@ static int __init printk_late_init(void)
>>  		}
>>  
>>  		unregister_console_locked(con);
>> +
>> +		/* Changed console list, may require printer threads to start/stop. */
>> +		printk_kthreads_check_locked();
>>  	}
>
> Should printk_kthreads_check_locked() be called after the
> hlist_for_each_entry_safe(con, tmp, &console_list, node) loop in
> printk_late_init() rather than inside the loop body?
>
> In kernel/printk/printk.c:printk_late_init():
>
>	hlist_for_each_entry_safe(con, tmp, &console_list, node) {
>		if (!(con->flags & CON_BOOT))
>			continue;
>		...
>		unregister_console_locked(con);
>
>		/* Changed console list, may require printer threads to start/stop. */
>		printk_kthreads_check_locked();
>	}
>	console_list_unlock();
>
> Because printk_kthreads_check_locked() is placed inside the loop,
> unregistering the last boot console sets have_boot_console to false and
> immediately attempts to start printer kthreads while the loop is still
> iterating over console_list.
>
> If kthread creation in legacy_kthread_create() or nbcon_kthread_create()
> fails for the console stored in tmp, printk_kthreads_check_locked() calls
> unregister_console_locked() on that console, removing it with
> hlist_del_init_rcu(), freeing nbcon resources, and invoking console->exit().
> On the next iteration of printk_late_init(), con is set to tmp, accessing the
> already-unregistered console and terminating the walk early because
> hlist_del_init_rcu() cleared tmp->next.

Geez, sorry. Obviously printk_kthreads_check_locked() needs to be
outside of the hlist_for_each_entry_safe(console_list) loop. That was
the whole point of the series!

I will wait a day for v2 in case there is any feedback regarding my
comments (or lack thereof).

John
