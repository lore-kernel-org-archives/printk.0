Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313904;
	b=d44abAHXNHTlQnY0Q0aQnbTkyiTghImVyCaqmXHajkN2w3Av7TpkxmlL1Zhqj8EsvatN
	 jQ3/oQVwgo0NBZcFYHoGLNafnrXv0zWaJ1Gazi1p3i+hi1OC3CRwc+hzLoUpnjVqVlMct
	 osjIbt9psIV55VihmIz8FxzLdwzX5BSkrlCwczqXQK96Zs7fWR6n1OkfoDtCblpp3FOz5
	 qKMs7t8vLkhvlNaudeaCb6RydnZtqysMGqiTbtzb18MDGJunWR1fGDAk8ZgcYIUBB3QoM
	 AWdCOQBfMnZiSDMHFimcgGc2eTQ0lxFJxSisxa8jFmKgeLE2vW1RijEC19vAwp8O7KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313904;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Fz622Hv9HVeZOLezQmXK0HnRQS0e6/rI5mneSuo3pRM=;
	b=vBeSoFl86fKLhoDahsgqrfHO7bDyJNQh9dmI37nVOPMZusIrQTZo8vs6Gtr/hKBLKcFD
	 XLWD2yPSt+hld3IyTkNZPjX5EXlGQXp/RDg8SlKz6USEbklaCUYhG9gkw24S1RIGW4NiM
	 NrB1v66bKFjX347pBN2kXFHQsczKaTS2jj54RGpr/SPmPLhx43ziJFbouMkxX9NlexLnn
	 HSxUv1C0unYa2dcHpDV4KzfehWrIyXfHfIGgYbmx8GKU6xbOpbMhJ52+3TAAIvEuO9Ed5
	 yiVDBxlXTJ+td2LS2YTU/4MIySm9h4JD7EnSjUtmpx9EIQJvuRWtkHBmr52f9Zmhfrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BbW2GjUA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687B6606A31C
	for <printk@lists.linux.dev>; Tue, 10 Nov 2026 12:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BbW2GjUA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BEF21F0089F;
	Tue, 10 Nov 2026 12:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794313904;
	bh=Fz622Hv9HVeZOLezQmXK0HnRQS0e6/rI5mneSuo3pRM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BbW2GjUADr4uW5llYz8hviCYMTSBHAlACQESW/yNq1AgaoQDzhY+3w8K25+eB1QgY
	 breQ6HivS6AEOGrL6RyN2odSHpV1oekfP2vRa5ZYhqhK+bBxV1Ns/SNFYVi6M6BO1r
	 UpFZrJYeTp/UucDS4QNEDQDBOUDy1wFsIc1wohXBQrX9oZttGDuiWWM507Vbzl6K5R
	 NGWLmZD8g43/jzVelm5W6GbpMiSKyCLIbv9pxbJ3d6TUHTzBydj7R1rptI93P16IFf
	 nsfy7oSmgtWorVArYEHIs6ubLLDDIT40n3CU8lm0YdR8CBat0dx0z/zpsvfBP55hlJ
	 5nl+tqUUKb7pw==
Message-ID: <sashiko-outbox-207025@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH printk 4/6] printk: Remove nbcon_atomic_flush_unsafe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Ogness" <john.ogness@linutronix.de>, "Petr Mladek" <pmladek@suse.com>
Cc: "Sergey Senozhatsky" <senozhatsky@chromium.org>, "Steven Rostedt" <rostedt@goodmis.org>, "Ryan
 Roberts" <ryan.roberts@arm.com>, "Breno Leitao" <leitao@debian.org>, printk@lists.linux.dev, "Andrew
 Morton" <akpm@linux-foundation.org>, Rio <rioo.tsukatsukii@gmail.com>, "Aaron
 Tomlin" <atomlin@atomlin.com>, "Bradley Morgan" <brads@mainlining.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>, "Alessandro
 Carminati" <acarmina@redhat.com>, "Randy Dunlap" <rdunlap@infradead.org>, "Pnina
 Feder" <pnina.feder@mobileye.com>, "Petr Pavlu" <petr.pavlu@suse.com>
In-Reply-To: <20261109123127.489676-5-john.ogness@linutronix.de>
References: <20261109123127.489676-1-john.ogness@linutronix.de>
 <20261109123127.489676-5-john.ogness@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 12:31:42 +0000
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
- [Medium] printk: vpanic() skips unsafe nbcon flush when boot console
  is active
--

commit 6f37b0702a64fde38f7e7f4187ca677f41bb3307d
Author: John Ogness <john.ogness@linutronix.de>

printk: Remove nbcon_atomic_flush_unsafe()

This commit removes nbcon_atomic_flush_unsafe() and replaces its call at
the end of vpanic() with printk_trigger_flush(PR_FLUSH_HANG).

> diff --git a/kernel/panic.c b/kernel/panic.c
> index a4dbb6b8cd2bf..7c03a17ba1288 100644
> --- a/kernel/panic.c
> +++ b/kernel/panic.c
> @@ -765,7 +765,7 @@ void vpanic(const char *fmt, va_list args)
>  	 * Explicitly flush the kernel log buffer one last time.
>  	 */
>  	console_flush_on_panic(CONSOLE_FLUSH_PENDING);
> -	nbcon_atomic_flush_unsafe();
> +	printk_trigger_flush(PR_FLUSH_HANG);
> =20
>  	local_irq_enable();
>  	for (i =3D 0; ; i +=3D PANIC_TIMER_STEP) {

[Severity: Medium]
Does replacing nbcon_atomic_flush_unsafe() with
printk_trigger_flush(PR_FLUSH_HANG) skip the final unsafe nbcon flush when
a boot console is still registered?

Previously, nbcon_atomic_flush_unsafe() unconditionally called
__nbcon_atomic_flush_pending(PR_FLUSH_HANG, ...) for all nbcon consoles.
printk_trigger_flush() only calls nbcon_atomic_flush_pending(reason) when
ft.nbcon_atomic is set by printk_get_console_flush_type():

kernel/printk/internal.h:printk_get_console_flush_type() {
	...
	case NBCON_PRIO_PANIC:
		if (have_nbcon_console && !have_boot_console)
			ft->nbcon_atomic =3D true;
	...
}

When have_boot_console is true (such as before printk_late_init() or with
keep_bootcon), ft.nbcon_atomic is false.  The fallback ft.legacy_direct
path in printk_trigger_flush() does not forward the flush reason to
nbcon_legacy_emit_next_record(), leaving ctxt->allow_unsafe_takeover false
(and does not run at all if console_trylock() fails or legacy printing is
deferred), so an nbcon console held in an unsafe state will no longer be
taken over and flushed at the end of panic.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109123127.4896=
76-1-john.ogness@linutronix.de?part=3D4
