Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234515;
	b=C+qzwrRo/PfOeq9gjalisHsIdczu5qme4+Tg1itsSJWi/bOodj/UnHuhEd9evcwbJr6X
	 FFmLMMnmQ0sx4O0suXI856JbUxDmdZOergQiGl+BpsOaYTff7lmHadZ1bs3Ulx5n5qrQ5
	 vErrYcBt25pjSybw4PBL6+9FI1FGyOBv8X7esCF1ScqCaUOXqvmOrRnSHWr1Jai/JmMHb
	 BkqbVUwxZjKT87oN9lMLQsdbTD3TbWpMS/JvjEedrgE1sObjqL7ZXWwrZ1hocoWs6oRLp
	 VP53v9IDTbki4tJfaRwQXiDRqGBEnwlhNslBlwDbdvl3AQhASuPqgJuUHWmx+24LZVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234515;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=wuAt7vs7/OEiZFj/5V5lEkMYa1zV5TJl/ZndutpYaE4=;
	b=mpt+GDV2cAOJ/VxouXrWiLhd4KOAuDb2EJnz6zg8qAJg3ScPuasl/oklw+eDs70R+4eE
	 XzkHloed/tJJmYbRJBFDdEdDSa3kqshAF+xS3PE0TpOlyZj6HP+Hgh2ruQMFwZ0lVi5QJ
	 Ss6Sna34KTt/TruknsWAb4pGyFA36Eb3QCPs4gZ/S0nSV5LVbMAAZQRa7TqLXNS7hO3RF
	 kL57n+nEYGaerk+II1JQhHn7vsCKdZCUIEteBePgsek84E+kgT5EnCbSJNJdGsDRqzW+l
	 3tFkrUcOi6a5bE1B6MjFOMPSE2aNVdsF0MiMfXSE4WPx6DRir29TMjAKgmEYKtN/XKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=dXJ7XneF;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="N/w6QWKC";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A9D606A338
	for <printk@lists.linux.dev>; Mon,  9 Nov 2026 14:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9A9D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=dXJ7XneF;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=N/w6QWKC
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794234512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wuAt7vs7/OEiZFj/5V5lEkMYa1zV5TJl/ZndutpYaE4=;
	b=dXJ7XneFNIB8X0WVn4QCjjDpisBMtZMwemokqO7ElLvzgWdLPFt0UzFWzkEnbuZ0ohIKIk
	hsz3IrB7Yim6GHWNUPTTGHNHQeTR3ftxW5Z9O7K+YiBJEHw4RnAZZaEIGZa3z9L6iieZT2
	Qjxe8PA8a5ioMKhALf3kx5lJX9bEsYCj23YEEgve++jXHWwtiK6DT+3WFGZnTK/VjFs+1o
	tqNGErEYUe9AowUmBOOq9EEap5LIdDcbO5ySIWZdblKTZcQJ1D/+wTVhEUV4tdlg+ZQDtA
	pGztMOhjYeIEaWBKyEg1i8TeX+ZRtwyk92IN8PZNrTbWgEKiGuXgbK6w1qb49g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794234512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wuAt7vs7/OEiZFj/5V5lEkMYa1zV5TJl/ZndutpYaE4=;
	b=N/w6QWKCUOtcLL8qfbXfeMx3HhWgO4m8xUV0Aaf0vMXKkFhNmjLd8j557oR9uQ1cAPVWFW
	P7mSSsXCRYn1ZFAA==
To: Breno Leitao <leitao@debian.org>
Cc: Petr Mladek <pmladek@suse.com>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Ryan
 Roberts <ryan.roberts@arm.com>, printk@lists.linux.dev,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH printk 3/6] printk: Evaluate flush policy in
 nbcon_allow_unsafe_takeover()
In-Reply-To: <avHTDeox8nDGLC6Q@gmail.com>
References: <20261109123127.489676-1-john.ogness@linutronix.de>
 <20261109123127.489676-4-john.ogness@linutronix.de>
 <avHTDeox8nDGLC6Q@gmail.com>
Date: Mon, 09 Nov 2026 15:34:32 +0106
Message-ID: <87qzgunkof.fsf@jogness.linutronix.de>
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

On 2026-11-09, Breno Leitao <leitao@debian.org> wrote:
>> @@ -1572,7 +1608,12 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, enum pr_flush_r
>>  	ctxt->console			= con;
>>  	ctxt->spinwait_max_us		= 2000;
>>  	ctxt->prio			= nbcon_get_default_prio();
>> -	ctxt->allow_unsafe_takeover	= nbcon_allow_unsafe_takeover();
>> +	ctxt->allow_unsafe_takeover	= nbcon_allow_unsafe_takeover(con, reason);
>
>
> Thanks for the series, I've tried it here, and I got:

Thanks for testing.

>   sysrq: Resetting
>     ------------[ cut here ]------------
>     WARNING: kernel/printk/nbcon.c:561 at nbcon_context_try_acquire+0x72c/0x790, CPU#0: sh/212
>     Modules linked in: nbcon_hold(OE+)
>     CPU: 0 UID: 0 PID: 212 Comm: sh Tainted: G           OE       7.4.0-rc1-next-20261105upstream-00006-g4170adac69fb #1 PREEMPT(full)
>     Hardware name: linux,dummy-virt (DT)
>     pc : nbcon_context_try_acquire+0x72c/0x790
>     lr : nbcon_context_try_acquire+0x508/0x790
>     ...
>     Call trace:
>      nbcon_context_try_acquire+0x72c/0x790 (P)
>      __nbcon_atomic_flush_pending_con+0x1c0/0x358
>      nbcon_atomic_flush_pending+0x224/0x390
>      printk_trigger_flush+0x50/0x1c8
>      emergency_restart+0x54/0x98
>      sysrq_handle_reboot+0x5c/0x88
>      __handle_sysrq+0x298/0x3c0
>      write_sysrq_trigger+0x178/0x1d0
>      proc_reg_write+0x148/0x270
>      vfs_write+0x1d4/0x7c8
>      ksys_write+0xbc/0x168
>      __arm64_sys_write+0x88/0xa8
>      invoke_syscall+0x74/0x188
>      do_el0_svc+0x108/0x190
>      el0_svc+0x60/0x1d8
>      el0t_64_sync_handler+0x68/0xe0
>      el0t_64_sync+0x198/0x1a0
>
> That is coming from:
>
>    550 static int nbcon_context_try_acquire_hostile(struct nbcon_context *ctxt,
>    551                                              struct nbcon_state *cur)
>    552 {
>    553         unsigned int cpu = smp_processor_id();
>    554         struct console *con = ctxt->console;
>    555         struct nbcon_state new;
>    556
>    557         if (!ctxt->allow_unsafe_takeover)
>    558                 return -EPERM;
>    559
>    560         /* Ensure caller is allowed to perform unsafe hostile takeovers. */
>    561         if (WARN_ON_ONCE(ctxt->prio != NBCON_PRIO_PANIC))
>    562                 return -EPERM;

Wow, you managed to get a hostile takeover. Out of curiousity, do you
know how dangerous this really is? Can this basically just result in
garbage on the network? Or is there dangers of running into the forest
with NULL or garbage pointers? And is the danger acceptable?

@pmladek: I expect we just need to remove the WARN_ON_ONCE() since this
series introduces unsafe takeovers when not in panic. Do you agree?

John
