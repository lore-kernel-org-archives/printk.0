Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795129438;
	b=GU7KL2PYhSxT8Jjp18yGExuJ0hWa8M/FMrXK/6ZMaCsem8uLymnraD7+iH84CR/vLE7M
	 QuMRr9psiA32gLs2P6pPe0ZZ4h2/fpg3FFxFIoHguMMPHndFeYQyanExGE4qVv15RsdwC
	 x0txUgnFiBduF60GKIw8VkJdTksbRjm+xPxkOH3i8DizhGvYVw1d/5Bz3Zgy+An4tcxNy
	 88EUdvvoeGS1gKgsXd0V8kyQrRRLi+HuZDML7MNzftZAVsSYnOsmLmDXX/v/0eOCLqV//
	 h7EXbBaTzP77f52CESt4Bm2qcgx6qV5Yxv6q2UJaoKeUNoDp9kokAHNk757kvaURf/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795129438;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oxsnfpGaJr5SWa3V8bh6fla61YluMPIBmH5n76Pa7XM=;
	b=bC4jSoTrwk9W6mG79OUxYIfAYlJKZmGQ3A3LVcXKDe51fWi5VBdtH0YqohFy9XcUjBOi
	 F7gT5jsSPej/CUk9iTUPkviTohGrGmBg1LSHxbfLsUr+/mwCS2m5rCDcA30TCJtuNvaWZ
	 eDTQ6GQTjP1WQ6cbr3WGkX7/BzJ3mpNa2UAPPrAmOFICxLsD7L0zLuqdkXFF0eYzUJZ4x
	 voxn0YL7XeIpehmoAgUYvuHXzWr6GL3BvfFx8NyyIltBqCCtDqGpDtDEdeRP6Y1YB8Z/H
	 uNLs0hBIFxuH8EuEyynHjm3hlCfghgYpYdqivsjOJtNoLPRDZJQ//tVWf6JOyWTSX5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="F5RlWeO/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58257606A320
	for <printk@lists.linux.dev>; Thu, 19 Nov 2026 23:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F5RlWeO/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C231F000C4;
	Thu, 19 Nov 2026 23:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795129438;
	bh=oxsnfpGaJr5SWa3V8bh6fla61YluMPIBmH5n76Pa7XM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F5RlWeO/bnjblL8OyAzoWftJJ30yHNjE9xp7YDc50n+bwaUAAt5iyvGE2L9IZQOPT
	 DdxYD3SaJrIgBGLDqiCyXZugqNNaOWsEp6ME/GU9krxlNfH3cg4Gq+giqohp0JVtOw
	 ngUZLeZAVf/8CG1zCi5o7dwspZW1MBmejY4P/d+yZKrlTwsfWcPF7mwM46Uk9H4Uy5
	 SuyB2jyWXClLQeNzEFjbL3hkI1aB6h9R7cjVf2XhJpOrWDh4jufNhu10HlOoC9ln3f
	 2KZegN8BiAl0s+be8jFzpvrvGwhfOd1Yw/K4+KuY3x9aZjAmsZVvQ/OS3Nl3UZG1lY
	 ZZlDANeqqFprw==
Message-ID: <sashiko-outbox-224168@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH printk v3 5/7] console: Support unsafe flushing for
 panic/emergency restarts
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Ogness" <john.ogness@linutronix.de>, "Petr Mladek" <pmladek@suse.com>
Cc: "Sergey Senozhatsky" <senozhatsky@chromium.org>, "Steven Rostedt" <rostedt@goodmis.org>, "Ryan
 Roberts" <ryan.roberts@arm.com>, "Breno Leitao" <leitao@debian.org>, printk@lists.linux.dev, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
In-Reply-To: <20261118230345.808560-6-john.ogness@linutronix.de>
References: <20261118230345.808560-1-john.ogness@linutronix.de>
 <20261118230345.808560-6-john.ogness@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 23:03:57 +0000
X-Mailing-List: printk@lists.linux.dev
List-Id: <printk.lists.linux.dev>
List-Post: <mailto:printk@lists.linux.dev>
List-Help: <mailto:printk+help@lists.linux.dev>
List-Subscribe: <mailto:printk+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:printk+unsubscribe@lists.linux.dev>
List-Owner: <mailto:printk+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] printk: nbcon: shared con->pbufs race in
  nbcon_context_try_acquire()
- [Medium] printk: nbcon: missing state checks in
  nbcon_context_try_acquire_hostile()
--

commit f5fa2c4aaf37e7c2f76889c2c2f671c2bb7b3a1a
Author: John Ogness <john.ogness@linutronix.de>

console: Support unsafe flushing for panic/emergency restarts

This commit introduces per-console unsafe atomic flush policy flags and a
PR_FLUSH_RESTART flush reason so consoles can opt into unsafe hostile
takeovers during panic or emergency restarts.

> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> index c3307b5b2c922..daf1fe8522117 100644
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -557,10 +557,6 @@ static int nbcon_context_try_acquire_hostile(struct =
nbcon_context *ctxt,
>  	if (!ctxt->allow_unsafe_takeover)
>  		return -EPERM;
> =20
> -	/* Ensure caller is allowed to perform unsafe hostile takeovers. */
> -	if (WARN_ON_ONCE(ctxt->prio !=3D NBCON_PRIO_PANIC))
> -		return -EPERM;
> -
>  	/*
>  	 * Check that try_acquire_direct() and try_acquire_handover() returned
>  	 * -EBUSY in the right situation.

[Severity: Medium]
Can an NBCON_PRIO_EMERGENCY hostile takeover clobber con->pbufs while the
interrupted NBCON_PRIO_NORMAL owner is still using it?

NBCON_PRIO_NORMAL and NBCON_PRIO_EMERGENCY share con->pbufs and rely on
the unsafe section in nbcon_emit_next_record() to keep them from writing
to it at the same time.  Previously only NBCON_PRIO_PANIC could perform a
hostile takeover of an unsafe section, and nbcon_context_try_acquire()
switched to panic_nbcon_pbufs when panic_on_this_cpu() was true:

kernel/printk/nbcon.c:nbcon_context_try_acquire() {
    ...
	/* Assign the appropriate buffer for this context. */
	if (panic_on_this_cpu())
		ctxt->pbufs =3D &panic_nbcon_pbufs;
	else
		ctxt->pbufs =3D con->pbufs;
    ...
}

During an emergency_restart() flush at NBCON_PRIO_EMERGENCY,
panic_on_this_cpu() is false, so a hostile takeover assigns con->pbufs to
the emergency context while the interrupted NBCON_PRIO_NORMAL context may
 still be formatting into or transmitting from con->pbufs:

CPU0                                  CPU1
nbcon_kthread_func()
  nbcon_emit_next_record()
    nbcon_context_enter_unsafe()
    printk_get_next_message()
      /* writes con->pbufs */
                                      nbcon_atomic_flush_unsafe()
                                        /* PR_FLUSH_RESTART,
                                           NBCON_PRIO_EMERGENCY */
                                        nbcon_context_try_acquire()
                                          nbcon_context_try_acquire_hostile=
()
                                          ctxt->pbufs =3D con->pbufs
                                        nbcon_emit_next_record()
                                          printk_get_next_message()
                                            /* overwrites con->pbufs */
    con->write_thread()
      /* reads corrupted con->pbufs */

> @@ -1465,12 +1461,19 @@ enum nbcon_prio nbcon_get_default_prio(void)
>  static bool nbcon_allow_unsafe_takeover(struct console *con, enum pr_flu=
sh_reason reason)
>  {
>  	enum nbcon_prio prio =3D nbcon_get_default_prio();
> +	int unsafe_policy =3D con->allow_unsafe_policy;
>  	bool allow =3D false;
> =20
>  	switch (reason) {
>  	case PR_FLUSH_RUNTIME:
>  		/* Never unsafe flush during runtime. */
>  		break;
> +	case PR_FLUSH_RESTART:
> +		if (prio =3D=3D NBCON_PRIO_PANIC)
> +			allow =3D (unsafe_policy & NBCON_PANIC_RESTART_FLUSH);
> +		else if (prio =3D=3D NBCON_PRIO_EMERGENCY)
> +			allow =3D (unsafe_policy & NBCON_EMERGENCY_RESTART_FLUSH);
> +		break;

[Severity: Medium]
Can an NBCON_PRIO_EMERGENCY caller in nbcon_context_try_acquire_hostile()
steal console ownership from a concurrent NBCON_PRIO_PANIC or
NBCON_PRIO_EMERGENCY owner if con->nbcon_state changes before the cmpxchg?

When only NBCON_PRIO_PANIC could enter nbcon_context_try_acquire_hostile(),
panic_on_other_cpu() blocked all other CPUs from acquiring the console or
raising cur->prio or cur->req_prio.  With NBCON_PRIO_EMERGENCY allowed to
perform a hostile takeover while other CPUs are still active, the retry
loop in nbcon_context_try_acquire_hostile() does not re-check cur after a
failed cmpxchg:

kernel/printk/nbcon.c:nbcon_context_try_acquire_hostile() {
    ...
	WARN_ON_ONCE(ctxt->prio <=3D cur->prio || ctxt->prio <=3D cur->req_prio);
	WARN_ON_ONCE(cur->unsafe !=3D true);

	do {
		new.atom =3D cur->atom;
		new.cpu			=3D cpu;
		new.prio		=3D ctxt->prio;
		new.unsafe		|=3D cur->unsafe_takeover;
		new.unsafe_takeover	|=3D cur->unsafe;

	} while (!nbcon_state_try_cmpxchg(con, cur, &new));
    ...
}

If the previous NBCON_PRIO_NORMAL owner releases the console and another
CPU acquires it at NBCON_PRIO_PANIC or NBCON_PRIO_EMERGENCY before CPU1's
first cmpxchg, the cmpxchg reloads cur and the next iteration overwrites
new.prio with NBCON_PRIO_EMERGENCY:

CPU0                            CPU1                      CPU2
/* owns con at
   NBCON_PRIO_NORMAL,
   cur.unsafe =3D=3D 1 */
                                /* NBCON_PRIO_EMERGENCY */
                                try_acquire_direct()
                                  -> -EBUSY
                                try_acquire_handover()
                                  -> -EBUSY
                                try_acquire_hostile()
nbcon_context_exit_unsafe()
nbcon_context_release()
                                                          panic()
                                                            try_acquire_dir=
ect()
                                                              /* acquires at
                                                                 NBCON_PRIO=
_PANIC */
                                  try_cmpxchg() fails,
                                  reloads cur.prio =3D PANIC
                                  try_cmpxchg() succeeds
                                  /* sets prio =3D EMERGENCY,
                                     stealing con from PANIC */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118230345.8085=
60-1-john.ogness@linutronix.de?part=3D5
