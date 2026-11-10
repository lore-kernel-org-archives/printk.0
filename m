Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313903;
	b=kg2CI8XWNPhKxy9yhIVW8x6ZBoZ7kFHpwcFzO1HZyIT6WX5TDMcxPP1PaGhmz3UPnNgP
	 zC+y4sorSZ4jvI7ozRfi6rd//pRaWDlUFsbeeS6bZ9/AUGNvkF5rw06T7NOtGwRGvI++C
	 Vdbpd/2aXr3SmsE5WNYrjrrp51SwtaVpUAjMCyXA+sWXXOREaL+QudMrQOHWed1ROcwQr
	 6fgxgpnJJECINOI45rtDhBaHDco4VcraE3V0VdRb1xki+YlkIdaMqj0Ji8T0MGuFeug45
	 AzOMLOF8FyGndYhRsSUb6LvCy6mBIDZkulcpbNJBlxwekvE+VGrLk2GvnmxxwZtsvUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313903;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QKrF3P9H8tXtBSEYDI/jfYzQGF1vgRWT01+qeeRSmV0=;
	b=nVRxikRAgIPjn2rftXQXABaZggT1S/ZSeFVw5+T/ALgdFcyfmheHOz9gBksdWHXvJa6I
	 Pa/WSiv/PYL8oOLTM6XiC7P1YxONDdlqiYrhhlB3vib74LllnFnmRLMALAExEttM/P8T/
	 JIYJY7Bv6t7naqqz48XcDgi8T+N86OfcaoRGJJeM6EApfFw5zsIHXKXubH46CBF2Ol11i
	 NS/vIVsh2ON6Kr+elaDdZhX7jZhkeWXsaFbRkhVdoEj0Lj3MTCcQipoUIBX94wRk1kZmz
	 5xGB9DBORkVdven3YStiQkHsaPj2wsi0ZdhuK5xTYqxL2ZFT62L+ixoSwrlnoNMp0Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LQd09AbA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E205A606A31C
	for <printk@lists.linux.dev>; Tue, 10 Nov 2026 12:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LQd09AbA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A30C1F008A1;
	Tue, 10 Nov 2026 12:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794313902;
	bh=QKrF3P9H8tXtBSEYDI/jfYzQGF1vgRWT01+qeeRSmV0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LQd09AbAf8nYo0DjhpXtOUiAENtn0rhBntxc2wC/WE0v81hhe7txE10+gJq+5R7Gf
	 OiQZlrm346pXXcmrcUUEdZaYwRwl5jddpJZqFXZyR645uizknq8WLyxHsCCTnQ8JF3
	 t+iikv9SoAuozmxMA5l97XV2GjJnwBIx3H2G0n8eqveKRWbPsdAPjBeEJpLRQnPb1C
	 weFueSvuEqCqJCfFuom9DfNSQL/hdorcLtYD9GX4UTttDCx2NGwSOc01KrsbdpxAsU
	 fzy5FLfd61iLE2lfP0VKKgoJgNBEiHvV/Re7kipm4VIKHASvEDF4NTTtrzPTDp9Pew
	 oq5vQw6j+TJ8w==
Message-ID: <sashiko-outbox-207024@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH printk 3/6] printk: Evaluate flush policy in
 nbcon_allow_unsafe_takeover()
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Ogness" <john.ogness@linutronix.de>, "Petr Mladek" <pmladek@suse.com>
Cc: "Sergey Senozhatsky" <senozhatsky@chromium.org>, "Steven Rostedt" <rostedt@goodmis.org>, "Ryan
 Roberts" <ryan.roberts@arm.com>, "Breno Leitao" <leitao@debian.org>, printk@lists.linux.dev, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
In-Reply-To: <20261109123127.489676-4-john.ogness@linutronix.de>
References: <20261109123127.489676-1-john.ogness@linutronix.de>
 <20261109123127.489676-4-john.ogness@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 12:31:41 +0000
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
- [High] printk: nbcon: unguarded unsafe write_atomic() in
  nbcon_legacy_emit_next_record()
- [High] printk: nbcon: non-panic allow_unsafe_takeover hits WARN in
  try_acquire_hostile()
--

commit 9f014302f348a33d58c0b585b64d7f094ae56e2b
Author: John Ogness <john.ogness@linutronix.de>

printk: Evaluate flush policy in nbcon_allow_unsafe_takeover()

This commit replaces the panic_nbcon_allow_unsafe_takeover global variable
by updating nbcon_allow_unsafe_takeover() to evaluate per-console unsafe
flush policy flags for a given flush reason, and moves the
CON_NBCON_ATOMIC_UNSAFE check out of console_is_usable() into the nbcon
acquire and flush paths.

> diff --git a/include/linux/console.h b/include/linux/console.h
> index 0841bf5e88aac..8f5097e7f4741 100644
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
Does removing the CON_NBCON_ATOMIC_UNSAFE check from console_is_usable()
allow console_flush_one_record() to invoke an unsafe write_atomic()
callback during normal runtime?

While __nbcon_atomic_flush_pending_con() and nbcon_kdb_try_acquire() now
check CON_NBCON_ATOMIC_UNSAFE, the legacy flushing loop still relies on
console_is_usable() when printing to nbcon consoles (for example, while a
boot console is registered):

kernel/printk/printk.c:console_flush_one_record() {
	...
		if (!console_is_usable(con, flags, !do_cond_resched))
			continue;
		any_usable =3D true;

		if (flags & CON_NBCON) {
			progress =3D nbcon_legacy_emit_next_record(con, handover, cookie,
								 !do_cond_resched);
	...
}

When do_cond_resched is false (such as in vprintk_emit() ->
console_trylock_spinning() -> console_unlock()), console_is_usable() now
returns true for a CON_NBCON_ATOMIC_UNSAFE console and
nbcon_legacy_emit_next_record() -> nbcon_emit_one() calls
con->write_atomic() without con->device_lock() or a check against
nbcon_allow_unsafe_takeover().  For a driver like netconsole, where
write_atomic() relies on device_lock() acquiring target_list_lock, this
causes unsynchronized traversal of target_list or a deadlock if printk()
is called while target_list_lock is already held.

> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> index 935fd6b86bac7..513bfd399858c 100644
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -1453,24 +1453,60 @@ enum nbcon_prio nbcon_get_default_prio(void)
>  	return NBCON_PRIO_NORMAL;
>  }
> =20
> -/*
> - * Track if it is allowed to perform unsafe hostile takeovers of console
> - * ownership. When true, console drivers might perform unsafe actions wh=
ile
> - * printing. It is externally available via nbcon_allow_unsafe_takeover(=
).
> - */
> -static bool panic_nbcon_allow_unsafe_takeover;
> -
>  /**
>   * nbcon_allow_unsafe_takeover - Check if unsafe console takeovers are a=
llowed
> + *					for a specified console and reason
>   *
> - * Return:	True, when it is permitted to perform unsafe console printing
> + * @con:	The console to check
> + * @reason:	The reason for the unsafe takeover
>   *
> - * This is also used by console_is_usable() to determine if it is allowe=
d to
> - * call write_atomic() callbacks flagged as unsafe (CON_NBCON_ATOMIC_UNS=
AFE).
> + * Return:	True, when @con is allowed to perform unsafe console printing
>   */
> -bool nbcon_allow_unsafe_takeover(void)
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
> =20
>  /**
> @@ -1572,7 +1608,12 @@ static int __nbcon_atomic_flush_pending_con(struct=
 console *con, enum pr_flush_r
>  	ctxt->console			=3D con;
>  	ctxt->spinwait_max_us		=3D 2000;
>  	ctxt->prio			=3D nbcon_get_default_prio();
> -	ctxt->allow_unsafe_takeover	=3D nbcon_allow_unsafe_takeover();
> +	ctxt->allow_unsafe_takeover	=3D nbcon_allow_unsafe_takeover(con, reason=
);
> +
> +	if ((console_srcu_read_flags(con) & CON_NBCON_ATOMIC_UNSAFE) &&
> +	    !ctxt->allow_unsafe_takeover) {
> +		return -EPERM;
> +	}
> =20
>  	while (nbcon_seq_read(con) < stop_seq) {
>  		/*

[ ... ]

> @@ -1976,8 +2015,14 @@ bool nbcon_kdb_try_acquire(struct console *con,
>  	struct nbcon_context *ctxt =3D &ACCESS_PRIVATE(wctxt, ctxt);
> =20
>  	memset(ctxt, 0, sizeof(*ctxt));
> -	ctxt->console =3D con;
> -	ctxt->prio    =3D NBCON_PRIO_EMERGENCY;
> +	ctxt->console			=3D con;
> +	ctxt->prio			=3D NBCON_PRIO_EMERGENCY;
> +	ctxt->allow_unsafe_takeover	=3D nbcon_allow_unsafe_takeover(con, PR_FLU=
SH_KDB);

[Severity: High]
When nbcon_allow_unsafe_takeover() returns true outside panic (or in
nbcon_kdb_try_acquire(), which always sets ctxt->prio to
NBCON_PRIO_EMERGENCY), won't a hostile takeover attempt trigger the
WARN_ON_ONCE() in nbcon_context_try_acquire_hostile() and fail with
-EPERM?

kernel/printk/nbcon.c:nbcon_context_try_acquire_hostile() {
	...
	if (!ctxt->allow_unsafe_takeover)
		return -EPERM;

	/* Ensure caller is allowed to perform unsafe hostile takeovers. */
	if (WARN_ON_ONCE(ctxt->prio !=3D NBCON_PRIO_PANIC))
		return -EPERM;
	...
}

If a console with NBCON_KDB or NBCON_NORMAL_NOTHREAD set in
con->unsafe_flush_flags is held in an unsafe section when KDB or
emergency_restart() tries to acquire it, nbcon_context_try_acquire() falls
through to nbcon_context_try_acquire_hostile(), hits the warning, and
refuses the takeover.  In addition, when ctxt->prio is NBCON_PRIO_NORMAL
(such as PR_FLUSH_RUNTIME after printk kthreads are shut down),
nbcon_context_try_acquire_direct() rejects a console already owned at
NBCON_PRIO_NORMAL (ctxt->prio <=3D cur->prio) with -EPERM before reaching
nbcon_context_try_acquire_hostile().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109123127.4896=
76-1-john.ogness@linutronix.de?part=3D3
