Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794507609;
	b=GPBYbWp588U11gTO97maa1eyyTXnMqcXQEI8HRsv2WLmmGj3//64j8+ilycqC+iYW0SI
	 1APkE98od7TI9b8ioTaOj1x8vYBEom1fTZPIInlehvSZT5/f9wJf7dn/RG/jQ6o5r2xXQ
	 iu60qdZgCwWzIRAiiNLoNLRgBd7cpvF9rHdRBtPET+jNtRNCOxipnkwe1Al1K+kqhUtMo
	 ToaJIm2AzNIyEx1He0Don1S6lzQIjMuCS/7JwZ58z2ukMOoQByv1Uag8C3qya6Xv/VNbY
	 BNfher66+fdJYTSXIwYGZLyiSLZr8L+ynecPNy1rMl3Eex7H+mzSFDy3i6joO84hRFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794507609;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3O1V2oJvm8u78hih6pje80+qPGInGnWTWWr+FggbG4c=;
	b=FA/FCMEXyPFnL3wRc36Rzy1qsVn5qkXklnvz8Aj/HnYpr88GxPvoG4vjJynxuY6+pFwr
	 BCVK9abhlj9xL2WsWLR+8KGDaGzg8lQTYyFazf66IgE3DKq+Bjmsv5q0IjAQYRA3Hafvs
	 LOfnAYrlJPRIUbxkX3Q4Gapb2fLiDhdDFHQPaeMR423s3smVCg0iSaIjgoLeEDlF9OEAr
	 oJL6NOgZySq4spm7ikhpdp069TlIzvJDrE2Rv6D81b8NNDDXP4ivPkdza4182oKku3nyO
	 Zvj8qne7t0BLcLJ7ZWU7BewmeCKXjT3wrBbQABLRyRsfsKIzPYC44mGCKCZpQyASMlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RJX4178v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0C3606A31C
	for <printk@lists.linux.dev>; Thu, 12 Nov 2026 18:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RJX4178v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5763D1F000C4;
	Thu, 12 Nov 2026 18:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794507608;
	bh=3O1V2oJvm8u78hih6pje80+qPGInGnWTWWr+FggbG4c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RJX4178v+J+PwurmATSTjpDY5TgRniCJjUk8E8uFMfaF6xkju7tPjZnCHKGzhTOXy
	 1Jz6BOVgH+/E0SQHWxbhQzezhtyErTQ8KqypuWO6zYa5vppU+bOOk75gT8dDSHgNa4
	 Y3GbZIvFJ64IOLz/naUXmvpVpG1shGPKOFDoeElJsLsyCAHkH1EP6+UXawzFIavHxj
	 56iVFwoDHwd7zeIEj+s9fjKNzdkj4smMKqdO7L8EZ32gn6od5gFHHingMsGtFFB0bV
	 y4fCkUpyB10vjIOUgo+cSskZfX/PHqTMoATnZTy/qirD4pvjL2Hl3u47qxWdyAoVHB
	 nKvad+WJ3X/EQ==
Message-ID: <sashiko-outbox-211692@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH printk v2 1/6] printk: Introduce and specify flush
 reasons
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Ogness" <john.ogness@linutronix.de>, "Petr Mladek" <pmladek@suse.com>
Cc: "Sergey Senozhatsky" <senozhatsky@chromium.org>, "Steven Rostedt" <rostedt@goodmis.org>, "Ryan
 Roberts" <ryan.roberts@arm.com>, "Breno Leitao" <leitao@debian.org>, printk@lists.linux.dev, "Huacai
 Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>, "Madhavan
 Srinivasan" <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>, "Nicholas
 Piggin" <npiggin@gmail.com>, =?utf-8?b?Q2hyaXN0b3BoZSBMZXJveSAoQ1MgR1JP?=
 =?utf-8?b?VVAp?= <chleroy@kernel.org>, =?utf-8?b?Uml0ZXNoIEhhcmphbmkg?=
 =?utf-8?b?KElCTSk=?= <ritesh.list@gmail.com>, "Shrikanth Hegde" <sshegde@linux.ibm.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Jason Wessel" <jason.wessel@windriver.com>, "Daniel
 Thompson" <danielt@kernel.org>, "Douglas Anderson" <dianders@chromium.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, "Mukesh Kumar Chaurasiya" <mchauras@linux.ibm.com>, "Feng
 Tang" <feng.tang@linux.alibaba.com>, Rio <rioo.tsukatsukii@gmail.com>, "Bradley
 Morgan" <brads@mainlining.org>, "Pnina Feder" <pnina.feder@mobileye.com>, "Gal
 Pressman" <gal@nvidia.com>, "Petr Pavlu" <petr.pavlu@suse.com>, "Pavel
 Tikhomirov" <ptikhomirov@virtuozzo.com>, "Oleg Nesterov" <oleg@redhat.com>,
 =?utf-8?b?Q2VuIFpoYW5nIChNaWNyb3NvZnQp?= <blbllhy@gmail.com>
In-Reply-To: <20261111181942.593695-2-john.ogness@linutronix.de>
References: <20261111181942.593695-1-john.ogness@linutronix.de>
 <20261111181942.593695-2-john.ogness@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 18:20:06 +0000
X-Mailing-List: printk@lists.linux.dev
List-Id: <printk.lists.linux.dev>
List-Post: <mailto:printk@lists.linux.dev>
List-Help: <mailto:printk+help@lists.linux.dev>
List-Subscribe: <mailto:printk+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:printk+unsubscribe@lists.linux.dev>
List-Owner: <mailto:printk+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] printk: unlocked reset of legacy_flush_reason in
  printk_trigger_flush()
--

commit 05bc755b72e7df0d3ba29e7530e04fba0747844c
Author: John Ogness <john.ogness@linutronix.de>

printk: Introduce and specify flush reasons

This commit introduces enum pr_flush_reason and propagates flush reasons
through printk_trigger_flush(), console_flush_on_panic(), and the nbcon and
legacy console flushing paths.

> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 5dbcf8a9909bb..c059b40fc993c 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -464,6 +464,14 @@ bool have_boot_console;
>  /* See printk_legacy_allow_panic_sync() for details. */
>  bool legacy_allow_panic_sync;
> =20
> +/*
> + * While some context is performing a backlog flush, track the reason for
> + * the flush in case nbcon consoles are using legacy printing.
> + * Synchronized by the console_lock, except in console_flush_on_panic()
> + * when the console_lock is ignored.
> + */
> +enum pr_flush_reason legacy_flush_reason =3D PR_FLUSH_RUNTIME;
> +
>  /* Avoid using irq_work when suspending. */
>  bool console_irqwork_blocked;

[ ... ]

> @@ -4732,18 +4745,21 @@ void defer_console_output(void)
>   * This is best effort. Depending on the system state, console states,
>   * and caller context, no actual flushing may result from this call.
>   */
> -void printk_trigger_flush(void)
> +void printk_trigger_flush(enum pr_flush_reason reason)
>  {
>  	struct console_flush_type ft;
> =20
>  	printk_get_console_flush_type(&ft);
>  	if (ft.nbcon_atomic)
> -		nbcon_atomic_flush_pending();
> +		nbcon_atomic_flush_pending(reason);
>  	if (ft.nbcon_offload)
>  		nbcon_kthreads_wake();
>  	if (ft.legacy_direct) {
> -		if (console_trylock())
> +		if (console_trylock()) {
> +			legacy_flush_reason =3D reason;
>  			console_unlock();
> +			legacy_flush_reason =3D PR_FLUSH_RUNTIME;
> +		}
>  	}
>  	if (ft.legacy_offload)
>  		defer_console_output();

[Severity: Medium]
Does resetting legacy_flush_reason after console_unlock() modify it outside
console_lock and race with the next lock owner?

console_unlock() either hands console_lock over to a spinning waiter or
releases console_sem in __console_unlock() before returning:

CPU0                                    CPU1
printk_trigger_flush(PR_FLUSH_RUNTIME)
  console_trylock()
  legacy_flush_reason =3D PR_FLUSH_RUNTIME
  console_unlock()
    __console_unlock()
                                        emergency_restart()
                                          printk_trigger_flush(PR_FLUSH_RES=
TART)
                                            console_trylock()
                                            legacy_flush_reason =3D PR_FLUS=
H_RESTART
  legacy_flush_reason =3D PR_FLUSH_RUNTIME
                                            console_unlock()  <-- flushes w=
ith PR_FLUSH_RUNTIME

This overwrites the active flush reason while CPU1 holds console_lock (or
while a spinning waiter that took over console_lock inside
console_flush_all() is still flushing).  Could legacy_flush_reason be reset
before __console_unlock() or inside __console_flush_and_unlock() while
console_lock is still held?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111181942.5936=
95-1-john.ogness@linutronix.de?part=3D1
