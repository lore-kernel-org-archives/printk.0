Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793645468;
	b=dAVmIHLU0dJBEpl7Oo6O3xOir1YGoQm3+PCh8oC3Pwig7jmnzZtPzDsob4vNnavwaVyg
	 HIH3UnX8Ximb/ChreGJYyzmD8TOXESF3Saq46IPGNB/H9xEpzNA7px8wE2fcEMPmlspGv
	 /vtLe34CaULSk/NurkxMV7C97EARp2N6phyVWrgxyfOm1mB85fdyK09NnEiy3FEr1YDD7
	 1jszx3xpb8Sj39pVy7Twq1E1gmweVkwYKPnZfNali0F9pka9zjYA+GDUYkoJigDz3yHLN
	 JzCSeTgwJqnrZ2++GrqZyLtIBWpoySNS1KUw13jf7z2RC/gpq32YCTX+04324D5z41A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793645468;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=K1M0RP613+J0XosQVX3wFXrK6dbBSCYY9g3ev6uHlDc=;
	b=RXm1booNAe8rOvJYmhYTfXVo3Z/3i3E1Fs7/nFkMXXOzWQs8CLJLJyds0OYLohOJXV7k
	 OOdubnkA2ICxMbHx6POkwEazK4iVBR8Tw9UlgrD1llTi5K/Xb49WzmoY+u0SH9JXJoSLL
	 fa3emT+pfaJykOE4af6BJWp2mw1jmk/6CQOE5zIWgfT8TcRb0gn5Xic/2yR1ele28AK3j
	 4/PFLCwDx3bbByPTcjXoRZYXJtSgptoqv06V2uM31siP+r+jqLbt5Xos9z5R4xBWjO9i9
	 mk/H/mRvGA1ie10btDalr1D1hGGOHrkwDDYLw259XNJC3/sZzkpdWC+UGu4egJ5jMMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jH3Ke2Zh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F78606A324
	for <printk@lists.linux.dev>; Mon,  2 Nov 2026 18:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jH3Ke2Zh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FAFB1F00A16;
	Mon,  2 Nov 2026 18:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793645468;
	bh=K1M0RP613+J0XosQVX3wFXrK6dbBSCYY9g3ev6uHlDc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jH3Ke2ZhrtkHbbRPX48YU4zh2r+ICUGVpOff61/rcHVZOHhwZ+kNlsu3LbbAd4/+/
	 LLyCxTJgiUBPK9CgU6hTgH1MPK7ViVpmeyfJbZ9ktX0mDQrj+lk3nrbPnz7stTI2aw
	 ZQWAxZ5UbDpjAemvFOCic3Ym6Hl5c0DaXLpPaOeUQbKWG0q3+mE7pMjXzzH/0zPRAs
	 7BB3Tj0BjTOhrmB1MTi8l7kL+tpsiZbt8wFonN1AIxE8QB9AyLV1wfNKhS+Varmuri
	 KQ5YRyIJFdvRp34EcOmEQUYCaXrpO1AppiRtMUQSRuXuchb6Z7bDmAjB2CVD+wTZUu
	 KFNPU5SHl/uVg==
Message-ID: <sashiko-outbox-193967@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] crash: Flush unsafe consoles before
 machine_crash_shutdown()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Breno Leitao" <leitao@debian.org>, "Petr Mladek" <pmladek@suse.com>, "John
 Ogness" <john.ogness@linutronix.de>, "Kiryl Shutsemau" <kas@kernel.org>
Cc: printk@lists.linux.dev, gustavold@gmail.com, samuelcrossley@gmail.com, ryan.roberts@arm.com, brads@mainlining.org, x86@kernel.org, kernel-team@meta.com
In-Reply-To: <20261102-panic_unsafe_flush-v1-2-12d1e22fd6d8@debian.org>
References: <20261102-panic_unsafe_flush-v1-0-12d1e22fd6d8@debian.org>
 <20261102-panic_unsafe_flush-v1-2-12d1e22fd6d8@debian.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 18:51:07 +0000
X-Mailing-List: printk@lists.linux.dev
List-Id: <printk.lists.linux.dev>
List-Post: <mailto:printk@lists.linux.dev>
List-Help: <mailto:printk+help@lists.linux.dev>
List-Subscribe: <mailto:printk+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:printk+unsubscribe@lists.linux.dev>
List-Owner: <mailto:printk+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] printk: nbcon: re-entrant printk() in unsafe flush corrupts stat=
e and buffer
- [Medium] crash: interrupts and preemption enabled in __crash_kexec() cons=
ole flush
--

commit 96308e7b9265481420ed9a4a2c3bd4f84534b26f
Author: Breno Leitao <leitao@debian.org>

crash: Flush unsafe consoles before machine_crash_shutdown()

This patch adds nbcon_atomic_unsafe_only_flush() to flush
CON_NBCON_ATOMIC_UNSAFE consoles with unsafe hostile takeovers enabled, and
calls it in __crash_kexec() before machine_crash_shutdown() so oops reports
reach consoles such as netconsole before kdump tears down device state.

> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index d0bd2d0cf8990..6580eaa86685a 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -140,6 +140,7 @@ void __noclone __crash_kexec(struct pt_regs *regs)
> =20
>  			crash_setup_regs(&fixed_regs, regs);
>  			crash_save_vmcoreinfo();
> +			nbcon_atomic_unsafe_only_flush();

[Severity: Medium]
Can calling nbcon_atomic_unsafe_only_flush() here before local interrupts
and preemption are disabled cause problems if an interrupt fires between
emitted records on panic_cpu?

Unlike vpanic(), which disables local interrupts and preemption before
calling panic_try_start(), crash_kexec() sets panic_cpu via
panic_try_start() without disabling interrupts or preemption, and local
interrupts are only disabled later inside machine_crash_shutdown().

Several architecture oops paths release die_lock and re-enable or restore
local interrupts before calling crash_kexec(regs), such as:

arch/powerpc/kernel/traps.c:oops_end()
arch/loongarch/kernel/traps.c:die()
arch/mips/kernel/traps.c:die()
arch/sh/kernel/traps.c:die()

crash_kexec() can also be invoked as a KF_DESTRUCTIVE BPF kfunc with
interrupts and preemption enabled.

When nbcon_atomic_unsafe_only_flush() flushes a multi-record oops report,
__nbcon_atomic_flush_pending_con() uses scoped_guard(irqsave) around each
individual record, restoring the caller's enabled interrupt state at the end
of every iteration:

kernel/printk/nbcon.c:__nbcon_atomic_flush_pending_con() {
	...
	while (nbcon_seq_read(con) < stop_seq) {
		scoped_guard(irqsave) {
			if (!nbcon_context_try_acquire(ctxt, false))
				return -EPERM;
			if (!nbcon_emit_next_record(&wctxt, true))
				return -EAGAIN;
			nbcon_context_release(ctxt);
		}
	}
	...
}

If a hardware interrupt fires between records while preemption is enabled,
could the crashing task be preempted and migrated off panic_cpu mid-flush?
Once on another CPU, panic_on_this_cpu() becomes false and
panic_on_other_cpu() becomes true, causing nbcon_context_try_acquire_direct=
()
to fail with -EPERM and machine_crash_shutdown() to execute on a different
CPU than panic_cpu.

Even without migration, if an interrupt handler on panic_cpu calls printk()
while panic_nbcon_allow_unsafe_takeover is true, it will re-enter
nbcon_atomic_flush_pending(), allowing hostile takeovers on safe consoles a=
nd
clearing panic_nbcon_allow_unsafe_takeover before returning to the interrup=
ted
flush; or if the interrupt handler calls panic(), vpanic() on panic_cpu will
fail kexec_trylock() because __crash_kexec() already holds kexec_lock.

> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> index 19fa9f79cac3c..c22175a33ce17 100644
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -1717,6 +1717,20 @@ void nbcon_atomic_flush_unsafe(void)
>  	panic_nbcon_allow_unsafe_takeover =3D false;
>  }
> =20
> +/**
> + * nbcon_atomic_unsafe_only_flush - Flush only the CON_NBCON_ATOMIC_UNSA=
FE
> + *	consoles, allowing unsafe hostile takeovers
> + *
> + * Like nbcon_atomic_flush_unsafe(), but consoles with a safe write_atom=
ic()
> + * are left alone. Only effective on the panic CPU.
> + */
> +void nbcon_atomic_unsafe_only_flush(void)
> +{
> +	panic_nbcon_allow_unsafe_takeover =3D true;
> +	__nbcon_atomic_flush_pending(prb_next_reserve_seq(prb), true);
> +	panic_nbcon_allow_unsafe_takeover =3D false;
> +}

[Severity: Medium]
What happens if a CON_NBCON_ATOMIC_UNSAFE console's write_atomic() callback
triggers a nested printk() or WARN() while nbcon_atomic_unsafe_only_flush()
is running?

In __crash_kexec(), suppress_printk is 0 and oops_in_progress is still 1 fr=
om
oops_begin(). During the flush:

__crash_kexec()
  nbcon_atomic_unsafe_only_flush()
    panic_nbcon_allow_unsafe_takeover =3D true;
    __nbcon_atomic_flush_pending(stop_seq, true)
      nbcon_atomic_flush_pending_con()
        nbcon_emit_next_record()
          con->write_atomic() (e.g. netconsole -> netpoll / NIC driver)
            printk() / WARN_ONCE()
              vprintk_emit()
                nbcon_atomic_flush_pending()

When vprintk_emit() calls nbcon_atomic_flush_pending(), it runs:

kernel/printk/nbcon.c:nbcon_atomic_flush_pending() {
	u64 stop_seq =3D prb_next_reserve_seq(prb);

	__nbcon_atomic_flush_pending(stop_seq, false);

	if (panic_on_this_cpu() && oops_in_progress) {
		panic_nbcon_allow_unsafe_takeover =3D true;
		__nbcon_atomic_flush_pending(stop_seq, true);
		panic_nbcon_allow_unsafe_takeover =3D false;
	}
}

Because panic_nbcon_allow_unsafe_takeover is already true on entry to the
nested nbcon_atomic_flush_pending(), doesn't this cause three issues?

1. The initial __nbcon_atomic_flush_pending(stop_seq, false) runs with
panic_nbcon_allow_unsafe_takeover set to true, allowing unsafe hostile
takeovers on safe consoles while other CPUs are still running in
__crash_kexec().

2. In nbcon_context_try_acquire(), every nbcon console acquired on the panic
CPU shares the single static panic_nbcon_pbufs buffer:

	if (panic_on_this_cpu())
		ctxt->pbufs =3D &panic_nbcon_pbufs;
	else
		ctxt->pbufs =3D con->pbufs;

When the nested flush acquires any other nbcon console and calls
nbcon_emit_next_record(), it formats into panic_nbcon_pbufs.outbuf,
overwriting wctxt->outbuf while the outer con->write_atomic() callback (such
as netconsole splitting a message across UDP fragments or iterating over
multiple targets) is still reading from it.

3. When the nested nbcon_atomic_flush_pending() finishes, it resets
panic_nbcon_allow_unsafe_takeover to false before returning to the outer
flush, so any remaining CON_NBCON_ATOMIC_UNSAFE consoles in the outer
nbcon_atomic_unsafe_only_flush() loop will no longer have
panic_nbcon_allow_unsafe_takeover enabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-panic_unsa=
fe_flush-v1-0-12d1e22fd6d8@debian.org?part=3D2
