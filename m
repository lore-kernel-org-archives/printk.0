Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794507610;
	b=1XgVQidPGcyjJYmn9OJoGezGiolS/M42pN50KlojPcqbgz7HBCCwUtaQditq1jsBs2Ks
	 NrIUzYnQfX4DpT2Yae1nOQgdZhXTiThDUzeLSLsJ48td5v5QocbFVQdZjccIHmY44kwZG
	 h6IaEHl7HI4K1TxuyMuDuzzfapkkltmij/yNwx6Bnzstwm5SUn1p/cSWQgQ/rKkIPd3ud
	 mOAbtU9qYRvrg8pdqg20UyuyJKEU4jqCcW2cjdf+tGRfNvkz1rGo+j8u4X2Q0VW66b2t6
	 1GTIbp2HYn4i0Ynm0/uMUokH6wBEk1dH2AQeGycCFRUIiYkOJXoXVgOg4wZtSCpU2DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794507610;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1ZccVG9R0j2OB4rspx+7mErXdrg5mv0EHA9Xx/4lQ6k=;
	b=PXP2FS5vq1wqihTXH584+h31zv2fq06BN5znjBCpS+QHHWGBS5mdLTnDGaDe0sGEKWdS
	 PWGMrrKLyASQu+bnErEJleij72whsuPUrpw8EhpUCMkMK+qkmng0Kd+/k+//ear2UIeT2
	 RZxrx10ujdwPPhh9pdtNIC/w3bgwM1ni8qEWVPjLqJCAMBNBzvbTQTQJPfH30VTyWTjlF
	 JJk9s2p+Lxz2XkhsqLODlnGi2oaPECE285PBQQGeqggbzTXmDsBPuaHB7JCTuXz14HxxF
	 l0UGjdGyp/s924hbQzIs0sPfOohEXVcP20Om+sdH4kUZwWAHi0stEWxnFiqyst/7gnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b6SxpRPA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814B9606A31C
	for <printk@lists.linux.dev>; Thu, 12 Nov 2026 18:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b6SxpRPA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD9C1F000C4;
	Thu, 12 Nov 2026 18:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794507610;
	bh=1ZccVG9R0j2OB4rspx+7mErXdrg5mv0EHA9Xx/4lQ6k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b6SxpRPA7uHpfLomCDPCegDoLLY8uD0uGtegw6ZJGRWbiJbHmfp/vSpDRGzrZrBHy
	 /bl9lzMQFH+JC1POqWmgkdqq62jCRSLwzyp2tKJ5+vu0lR+c1o0xmcxhH9uhxAeHkc
	 KYYCM2BQuyw7sx8GiFB13+LheP2tn/t0nSa7bZu0CHH+9fMhxUypE1/sBzJ3536OPQ
	 RXkkxqCQtUY7ScVV6eY/djeg3GIdf5m0d8sA3xptas7g57jKCFcOQ6s+Ieb5wiBMob
	 8X0P6k/OfSqbse1+nkdHvDAe7os0kZ2HQsrxjb520tUa081sBYYyCG/5yAYhhVQFNr
	 qlpdgde9jFFbg==
Message-ID: <sashiko-outbox-211694@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH printk v2 3/6] printk: Evaluate flush policy in
 nbcon_allow_unsafe_takeover()
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Ogness" <john.ogness@linutronix.de>, "Petr Mladek" <pmladek@suse.com>
Cc: "Sergey Senozhatsky" <senozhatsky@chromium.org>, "Steven Rostedt" <rostedt@goodmis.org>, "Ryan
 Roberts" <ryan.roberts@arm.com>, "Breno Leitao" <leitao@debian.org>, printk@lists.linux.dev, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
In-Reply-To: <20261111181942.593695-4-john.ogness@linutronix.de>
References: <20261111181942.593695-1-john.ogness@linutronix.de>
 <20261111181942.593695-4-john.ogness@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 18:20:08 +0000
X-Mailing-List: printk@lists.linux.dev
List-Id: <printk.lists.linux.dev>
List-Post: <mailto:printk@lists.linux.dev>
List-Help: <mailto:printk+help@lists.linux.dev>
List-Subscribe: <mailto:printk+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:printk+unsubscribe@lists.linux.dev>
List-Owner: <mailto:printk+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [High] printk: infinite loop in __console_flush_and_unlock() for
  atomic-unsafe nbcon
- [High] printk: nbcon: non-panic hostile takeovers corrupt pbufs and
  deadlock reacquire
- [Medium] printk: nbcon: priority checks block non-panic unsafe hostile
  takeovers
- [Medium] printk: nbcon: unvalidated state in
  nbcon_context_try_acquire_hostile() loop
- [Medium] printk: nbcon_allow_unsafe_takeover() matches SYSTEM_SUSPEND
  on shutdown check
--

commit 86f4d1a44fe2165e053c542b740c4c0a437ea5d5
Author: John Ogness <john.ogness@linutronix.de>

printk: Evaluate flush policy in nbcon_allow_unsafe_takeover()

This commit replaces the global panic_nbcon_allow_unsafe_takeover flag
with per-console policy evaluation in nbcon_allow_unsafe_takeover() based
on the flush reason, and moves the CON_NBCON_ATOMIC_UNSAFE check out of
console_is_usable() into the nbcon acquire and flush paths.

> diff --git a/include/linux/console.h b/include/linux/console.h
> index beb1ee04535b7..b5024a879b96a 100644
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
[ ... ]
> @@ -670,13 +670,6 @@ static inline bool console_is_usable(struct console =
*con, short flags, bool use_
>  			/* The write_atomic() callback is optional. */
>  			if (!con->write_atomic)
>  				return false;
> -
> -			/*
> -			 * An unsafe write_atomic() callback is only usable
> -			 * when unsafe takeovers are allowed.
> -			 */
> -			if ((flags & CON_NBCON_ATOMIC_UNSAFE) && !nbcon_allow_unsafe_takeover=
())
> -				return false;
>  		}
> =20
>  		/*

[Severity: High]
Can removing the CON_NBCON_ATOMIC_UNSAFE check from console_is_usable()
cause __console_flush_and_unlock() to spin in an infinite loop when
flushing via the legacy loop in atomic mode?

When have_boot_console is set, printk_get_console_flush_type() routes
nbcon consoles through console_flush_all(). If console_unlock() runs with
console_may_schedule =3D=3D 0 (for example from vprintk_emit() with preempt=
ion
disabled), console_flush_one_record() calls console_is_usable(con, flags,
true), which now returns true for a CON_NBCON_ATOMIC_UNSAFE console and
sets any_usable =3D true:

kernel/printk/printk.c:console_flush_one_record() {
    ...
		if (!console_is_usable(con, flags, !do_cond_resched))
			continue;
		any_usable =3D true;

		if (flags & CON_NBCON) {
			progress =3D nbcon_legacy_emit_next_record(con, handover, cookie,
								 !do_cond_resched);
			printk_seq =3D nbcon_seq_read(con);
    ...
}

nbcon_legacy_emit_next_record() then returns false because
allow_unsafe_takeover is false, leaving nbcon_seq_read(con) unchanged and
setting *next_seq to that unprinted sequence number. If no other usable
console advances *next_seq past the ringbuffer head (for instance while
unregister_console_locked() is removing the boot console and sleeping in
synchronize_srcu() before updating have_boot_console, or when the boot
console is suspended), console_flush_all() returns flushed =3D true with
*next_seq still valid in prb, and __console_flush_and_unlock() loops
forever on while (prb_read_valid(prb, next_seq, NULL) &&
console_trylock()).

In addition, unregister_console_locked() checks console_is_usable(console,
console->flags, true) before calling __pr_flush(console, 1000, true). When
printk kthreads are not running, unregistering a CON_NBCON_ATOMIC_UNSAFE
console now stalls for the full 1000ms timeout because neither a kthread
nor atomic flushing can advance it.

> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> index 935fd6b86bac7..d4d2fc51f2aa7 100644
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

[Severity: High]
Can allowing hostile takeovers outside the final panic flush corrupt
con->pbufs and cause interrupted console drivers to spin forever?

First, nbcon_context_try_acquire() only selects panic_nbcon_pbufs when
panic_on_this_cpu() is true, and otherwise assigns ctxt->pbufs =3D
con->pbufs. NBCON_PRIO_NORMAL and NBCON_PRIO_EMERGENCY share con->pbufs
and rely on the unsafe section in nbcon_emit_next_record() to avoid
clobbering each other's buffer. If a non-panic context (such as
emergency_restart() with NBCON_NORMAL_NOTHREAD or KDB with NBCON_KDB)
performs a hostile takeover while an owner is in that unsafe section, both
contexts concurrently read and write con->pbufs.

Second, a hostile takeover sets cur.unsafe_takeover =3D 1, which causes
__nbcon_context_update_unsafe() and nbcon_context_release() to keep
cur.unsafe =3D 1 permanently. Any later acquire with allow_unsafe_takeover
=3D=3D false then fails. When an interrupted driver (such as
serial8250_console_write() or pl011_console_write_thread()) tries to
restore hardware state via nbcon_reacquire_nobuf(), or when a caller
enters __uart_port_nbcon_acquire() after KDB exits, it spins forever:

CPU0                              CPU1
serial8250_console_write()
  nbcon_enter_unsafe()
                                  kdb / emergency_restart()
                                    ...
                                      nbcon_context_try_acquire_hostile()
                                        /* sets unsafe_takeover =3D 1 */
                                    nbcon_context_release()
                                      /* leaves unsafe =3D 1 */
  nbcon_exit_unsafe() -> false
  nbcon_reacquire_nobuf()
    while (!nbcon_context_try_acquire(ctxt, true))
      cpu_relax();                <-- spins forever

>  	/*
>  	 * Check that try_acquire_direct() and try_acquire_handover() returned
>  	 * -EBUSY in the right situation.

[Severity: Medium]
What happens in nbcon_context_try_acquire_hostile() if con->nbcon_state
changes on another CPU before nbcon_state_try_cmpxchg() succeeds?

Previously nbcon_context_try_acquire_hostile() only ran at the end of
panic() after other CPUs were stopped. Now that it can run while other
CPUs are active (such as during early panic printk() calls with
NBCON_PANIC_PRINTK or in emergency_restart()), the do-while cmpxchg loop
does not recheck cur->unsafe, cur->prio, or cur->req_prio after a failed
cmpxchg updates cur:

kernel/printk/nbcon.c:nbcon_context_try_acquire_hostile() {
    ...
	do {
		new.atom =3D cur->atom;
		new.cpu			=3D cpu;
		new.prio		=3D ctxt->prio;
		new.unsafe		|=3D cur->unsafe_takeover;
		new.unsafe_takeover	|=3D cur->unsafe;

	} while (!nbcon_state_try_cmpxchg(con, cur, &new));
    ...
}

If the previous owner exits its unsafe section or releases the console, or
if another CPU enters panic and acquires the console with
NBCON_PRIO_PANIC, the next loop iteration will still overwrite
con->nbcon_state with ctxt->prio and leave any stale req_prio set.

> @@ -1453,24 +1449,60 @@ enum nbcon_prio nbcon_get_default_prio(void)
[ ... ]
> +static bool nbcon_allow_unsafe_takeover(struct console *con, enum pr_flu=
sh_reason reason)
>  {
> -	return panic_on_this_cpu() && panic_nbcon_allow_unsafe_takeover;
> +	int unsafe_flags =3D con->unsafe_flush_flags;
> +	bool in_panic =3D panic_on_this_cpu();
> +	bool allow =3D false;
> +
> +	switch (reason) {
> +	case PR_FLUSH_RUNTIME:
> +		if (in_panic) {
> +			if (unsafe_flags & NBCON_PANIC_PRINTK)
> +				allow =3D true;
> +
> +		} else {
> +			/* Only when the kthreads have been shutdown. */
> +			if ((unsafe_flags & NBCON_NORMAL_NOTHREAD) &&
> +			    !con->kthread &&
> +			    system_state > SYSTEM_RUNNING) {
> +				allow =3D true;
> +			}
> +		}
> +		break;

[Severity: Medium]
Does system_state > SYSTEM_RUNNING also match SYSTEM_SUSPEND?

In enum system_states, SYSTEM_SUSPEND is ordered after SYSTEM_RUNNING, and
con->kthread is NULL whenever have_boot_console is true (for example with
keep_bootcon). If the system suspends or hibernates with
no_console_suspend and a boot console registered, any runtime printk()
while system_state =3D=3D SYSTEM_SUSPEND will see !con->kthread &&
system_state > SYSTEM_RUNNING and allow unsafe takeovers and
CON_NBCON_ATOMIC_UNSAFE callbacks during suspend. Checking for an explicit
kthread-shutdown flag set by printk_kthreads_shutdown() (or excluding
SYSTEM_SUSPEND) would avoid enabling unsafe flushing when the kernel is
not shutting down.

> +	case PR_FLUSH_RESTART:
> +		/* kexec, reboot */
> +
> +		if (in_panic) {
> +			if (unsafe_flags & NBCON_PANIC_FLUSH)
> +				allow =3D true;
> +
> +		} else {
> +			/* Printing kthreads not reliable. */
> +			if (unsafe_flags & NBCON_NORMAL_NOTHREAD)
> +				allow =3D true;
> +		}
> +		break;
> +	case PR_FLUSH_HANG:
> +		/* Always unsafe flush before hang. */
> +		allow =3D true;
> +		break;
> +	case PR_FLUSH_KDB:
> +		if (unsafe_flags & NBCON_KDB)
> +			allow =3D true;
> +		break;
> +	}
> +
> +	return allow;
>  }

[Severity: Medium]
Can non-panic contexts where nbcon_allow_unsafe_takeover() returns true
actually perform a hostile takeover when the console is already owned?

For PR_FLUSH_RUNTIME after kthreads are shut down, PR_FLUSH_RESTART
outside an emergency section, PR_FLUSH_HANG outside panic (e.g.
machine_halt()), and PR_FLUSH_KDB via nbcon_kdb_release(),
nbcon_get_default_prio() sets ctxt->prio to NBCON_PRIO_NORMAL. When the
console is already owned (cur->prio >=3D NBCON_PRIO_NORMAL),
nbcon_context_try_acquire_direct() returns -EPERM at the priority check:

kernel/printk/nbcon.c:nbcon_context_try_acquire_direct() {
    ...
		if (ctxt->prio <=3D cur->prio || ctxt->prio <=3D cur->req_prio)
			return -EPERM;

		if (cur->unsafe)
			return -EBUSY;
    ...
}

nbcon_context_try_acquire() then aborts on err !=3D -EBUSY before reaching
nbcon_context_try_acquire_hostile(). Even at NBCON_PRIO_EMERGENCY (such as
in nbcon_kdb_try_acquire() or emergency_restart()), a hostile takeover is
rejected with -EPERM if the console is held by another EMERGENCY or PANIC
owner (for example when entering KDB from kgdb_panic()), and if KDB runs on
a non-panic CPU during panic while cur->unsafe is set,
nbcon_context_try_acquire_handover() unconditionally returns -EPERM on
panic_on_other_cpu() without checking kdb_printf_on_this_cpu().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111181942.5936=
95-1-john.ogness@linutronix.de?part=3D3
