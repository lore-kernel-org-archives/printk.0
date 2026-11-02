Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793644188;
	b=pu+9ZzjRl/4x/94lvYB4BrKtLOl0IewfKPU/uNWC2FxiTcl40jdDAZwSo1mMoyNq0Dyd
	 mpyPiIdAzWa/mvz2wPhuft/K8txCB/mFLvOg4rOsVWVP8LZQOntBrpWNhI+sjTosHyl9C
	 k95OJPN2klqwigyUm/ZI7ZuLwXuJeM54f3+a9vud2G9Fjwr3aqQCv4Ish/H7TMi5qSWx1
	 y2EgtGmLs3DFE+fM8XDzekY9Od416SPww5Zk248FZmcT4GkKUxmcxlGpbUWZ9agIzfAfF
	 4gYg2Fo5v/2rwsGUbTlh1Qzrc6fahppGPHMcKzRhKdSsQEI8GGaHOVVlESkEQSrt87Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793644188;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QJRyOV/TFuwIYYQ8jJ3BuEmKii2Ld0qzIHRasNJ/U+s=;
	b=ewHu+zj2va7eMvdTreTNFE6uH9k7+VwcSA90+FKZBQ70twTLFwGL76c7kG48VcuW1xFG
	 2Sh9WNIpluWlo2eYKFREmUB1aaxcD+qXCkVz6H9tk0O8lhry8hS5eV8NbBfXRxShbiCMu
	 BP15RHMdUglEdOx7CAFY8ncW55hCZiMFKpCZ8hr94mrrwEQXLpeSw+huPt9W8V7cy8lvK
	 uh5HNGTKZcYQ0EBOyK/rw2pprKX0XYnmXcyxoKeKRBDp8LxK1VzA0ek6ETMPlInPNLnJy
	 yVKnpsXFwOwTec2nBr2H0J7vbgLjzac7w58b+uP99wTwCqob7MJcKmbYcxS+ISfZxBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dMhbSWOo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB24606A332
	for <printk@lists.linux.dev>; Mon,  2 Nov 2026 18:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dMhbSWOo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 094A61F00A16;
	Mon,  2 Nov 2026 18:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793644187;
	bh=QJRyOV/TFuwIYYQ8jJ3BuEmKii2Ld0qzIHRasNJ/U+s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dMhbSWOoJ4KNSAHSQpzwYVvwV7ZiLa8rEPAVHRuhbqv51f8iDDQHHdmQZ5VzWrEcx
	 UYySWoIEnbNEstTMKEA6GobYDzC+5K0jjPUY8zgg5Cu7cYYPMs2EhRnXEOn1yGPbpu
	 sm+6XIQBB2GjUK2zwO9XIT4G3xhIoSOAC3BH9gLONkdIJOBd0Y4BQ/dIux2Ht7st9j
	 yUOLEnBwKOKyfkuGpDhoBmHh9Ds68Y+wfIA7RCjz7h7q/Ck2topWgbgst4mVX6x+we
	 SDd1ut8r04Jir8cX7hkRC+6M1Lsv4OS+P64BCyWJuHJ3oIDwPVCjABjsSKKBzgafEY
	 jssIOMXFy1JmQ==
Message-ID: <sashiko-outbox-193942@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] printk: nbcon: Flush unsafe consoles from printk()
 in panic
Reply-To: sashiko-reviews@lists.linux.dev
To: "Breno Leitao" <leitao@debian.org>, "Petr Mladek" <pmladek@suse.com>, "John
 Ogness" <john.ogness@linutronix.de>, "Kiryl Shutsemau" <kas@kernel.org>
Cc: printk@lists.linux.dev, gustavold@gmail.com, samuelcrossley@gmail.com, ryan.roberts@arm.com, brads@mainlining.org, x86@kernel.org, kernel-team@meta.com
In-Reply-To: <20261102-panic_unsafe_flush-v1-1-12d1e22fd6d8@debian.org>
References: <20261102-panic_unsafe_flush-v1-0-12d1e22fd6d8@debian.org>
 <20261102-panic_unsafe_flush-v1-1-12d1e22fd6d8@debian.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 18:29:46 +0000
X-Mailing-List: printk@lists.linux.dev
List-Id: <printk.lists.linux.dev>
List-Post: <mailto:printk@lists.linux.dev>
List-Help: <mailto:printk+help@lists.linux.dev>
List-Subscribe: <mailto:printk+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:printk+unsubscribe@lists.linux.dev>
List-Owner: <mailto:printk+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] printk: nbcon: nested printk() in nbcon_atomic_flush_pending() c=
orrupts state
--

commit 8683fa106aa2304e041764eca5971a98495ef1b9
Author: Breno Leitao <leitao@debian.org>

printk: nbcon: Flush unsafe consoles from printk() in panic

This commit flushes CON_NBCON_ATOMIC_UNSAFE consoles from
nbcon_atomic_flush_pending() when running on the panic CPU with
oops_in_progress set, so that panic messages reach netconsole before a
panic reboot or crash kexec.

> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> index 5f8afaca88665..19fa9f79cac3c 100644
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c

[ ... ]

> @@ -1688,7 +1692,15 @@ static void __nbcon_atomic_flush_pending(u64 stop_=
seq)
>   */
>  void nbcon_atomic_flush_pending(void)
>  {
> -	__nbcon_atomic_flush_pending(prb_next_reserve_seq(prb));
> +	u64 stop_seq =3D prb_next_reserve_seq(prb);
> +
> +	__nbcon_atomic_flush_pending(stop_seq, false);
> +
> +	if (panic_on_this_cpu() && oops_in_progress) {
> +		panic_nbcon_allow_unsafe_takeover =3D true;
> +		__nbcon_atomic_flush_pending(stop_seq, true);
> +		panic_nbcon_allow_unsafe_takeover =3D false;
> +	}
>  }

[Severity: Medium]
Can a nested printk() or WARN() inside an unsafe console's write_atomic()
callback re-enter nbcon_atomic_flush_pending() and corrupt the outer flush?

Previously, CON_NBCON_ATOMIC_UNSAFE consoles were only flushed from
nbcon_atomic_flush_unsafe() at the end of vpanic() after suppress_printk
was set, so any nested printk() returned immediately in vprintk_emit().

With this change, CON_NBCON_ATOMIC_UNSAFE callbacks run during vpanic()
while suppress_printk is still 0. In netconsole, write_atomic() calls into
netpoll, skb allocation, and network driver paths that can trigger a nested
printk() or WARN(), such as netcons_skb_pop() in drivers/net/netconsole.c:

	if (!in_nmi())
		net_warn_ratelimited("netconsole: dropping message, requested skb len %d =
exceeds pool buffer size %zu on %s\n",
				     len, (size_t)MAX_SKB_SIZE,
				     nt->np.dev->name);

Because vprintk_store() exits printk_enter_irqsave() before vprintk_emit()
calls nbcon_atomic_flush_pending(), a nested printk() synchronously
re-enters nbcon_atomic_flush_pending():

  vprintk_emit()
    nbcon_atomic_flush_pending()
      panic_nbcon_allow_unsafe_takeover =3D true;
      __nbcon_atomic_flush_pending(stop_seq, true)
        nbcon_atomic_flush_pending_con()
          con->write_atomic()
            printk() / WARN()
              vprintk_emit()
                nbcon_atomic_flush_pending()

When that happens:

1. In kernel/printk/nbcon.c:nbcon_context_try_acquire(), all nbcon consoles
on the panic CPU share the single static panic_nbcon_pbufs instance:

	if (panic_on_this_cpu())
		ctxt->pbufs =3D &panic_nbcon_pbufs;
	else
		ctxt->pbufs =3D con->pbufs;

Flushing any other nbcon console during the nested call overwrites
panic_nbcon_pbufs.outbuf while the outer write_atomic() callback is still
reading from wctxt->outbuf (for example across UDP fragments or multiple
netconsole targets).

2. The nested nbcon_atomic_flush_pending() runs its first pass
__nbcon_atomic_flush_pending(stop_seq, false) while
panic_nbcon_allow_unsafe_takeover is still true from the outer call,
allowing unsafe hostile takeovers on safe nbcon consoles and treating
CON_NBCON_ATOMIC_UNSAFE consoles as usable during the first pass.

3. When the nested nbcon_atomic_flush_pending() finishes, it resets
panic_nbcon_allow_unsafe_takeover to false. The outer flush then skips any
remaining CON_NBCON_ATOMIC_UNSAFE consoles in __nbcon_atomic_flush_pending()
because console_is_usable() sees nbcon_allow_unsafe_takeover() as false,
and the retry loop in nbcon_atomic_flush_pending_con():

	printk_get_console_flush_type(&ft);
	if (!ft.nbcon_offload &&
	    prb_read_valid(prb, nbcon_seq_read(con), NULL)) {
		stop_seq =3D prb_next_reserve_seq(prb);
		goto again;
	}

runs with allow_unsafe_takeover set to false.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-panic_unsa=
fe_flush-v1-0-12d1e22fd6d8@debian.org?part=3D1
