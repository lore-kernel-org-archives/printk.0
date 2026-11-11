Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416465;
	b=QcI0dyKO/SHonsqmpXU8iG4toX3E6UwVsve+QbBLPXAZMYihd4yOE6OmBw1VtH38OYZH
	 rEsDtlOBr39K2UI+c000RLFbraYiYdYvDoysLXOYtOeNFTAFlzkYfisDieKCeNSDczS7o
	 BNmT8JZi7HWlgVLV//upBdqc84lNo9bKQcHNXVV4F4lfCzAhuEv2dYnOs5SKr1eUvIpNZ
	 lnMswuD8xnvkhWmHVBx3SfKm/9Srn28GDiwldKrcKbeP7EFIYSVY1k112vuD5WR8voISi
	 RKLeACMw2CYXPqo6HAy4D9UKyL5CYy7v6chA0YP1IloEuLZXTP1rxk86HrABgAcjO6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416465;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=30eYgvS3A73dBkxc3mOvRp8UHRdxyCfi7VWrfcpop+0=;
	b=KWC5fe4ZOFD7o5HQuLrMywcHLV2z0N/Amm1qReLx7k0ybwOUxJYh8Oj8wf+FYtLlLckY
	 BxT4mO4TVwTTCJQVH0j2IL0uVxG38dPDknbFMXGgbv5X8+O8KbO+tDUSNZX6crhPIj6sW
	 PbSDE76g21wROM9uSEPRyUX6Yd7G8Eatbam7RC14NwimhKXQjlnmOEiBSXYuYPC5B8jyv
	 Vv3t/6PA+61peTZQUWtO9nRy/FT/0m6yY+napXVfHY3a2VPUt8zIos4luz9ds/e77TIP4
	 9lX9qMVspieopasJh11eL+ZJgcauHkAgw8O2jPPkfnbKpMNgZUkXeoT+dFxSDbKVOxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=btrMJJg9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFF3606A31C
	for <printk@lists.linux.dev>; Wed, 11 Nov 2026 17:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=btrMJJg9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A99401F00A08;
	Wed, 11 Nov 2026 17:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794416465;
	bh=30eYgvS3A73dBkxc3mOvRp8UHRdxyCfi7VWrfcpop+0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=btrMJJg9BD8Yhm+BgCKw0qTrpSW22BIHPfCGyop5gokxDFiOtXLwEZi0zwWANrQqL
	 PdQjENMOtuUQDtkVQ4h45bBWcOiXNM8k4Ir/Hs6iYF3l9JJX3YzZHqW1kFhbBbOs0B
	 k4VZloFM9+LmEEG6x0Q1bsFKfMGeja4fl8M8vtXElxm7dHaRTwevH6pKxg6QhCFn44
	 YKIzl12Nmt9S5uUWvwylzPwxa2nOw553WZ4g0DxrPdtfz6Ej95zjHHv8kk6OAHbLhP
	 u/fW5DlwB1UE360fVfD2KSCXcp0ge3cH4Mdha+Ti0QxzBtWoRvA/apBCUSlVP00V1e
	 aKQQybFSwp90g==
Message-ID: <sashiko-outbox-209356@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 11/17] console/braille: Lock console->setup() call
 during the registration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petr Mladek" <pmladek@suse.com>, "John Ogness" <john.ogness@linutronix.de>
Cc: "Sergey Senozhatsky" <senozhatsky@chromium.org>, "Steven Rostedt" <rostedt@goodmis.org>, "Marcos
 Paulo de Souza" <mpdesouza@suse.com>, "Chris Down" <chris@chrisdown.name>, "Naveen
 Kumar Chaudhary" <naveen.osdev@gmail.com>, printk@lists.linux.dev
In-Reply-To: <20261111154816.71103-12-pmladek@suse.com>
References: <20261111154816.71103-1-pmladek@suse.com>
 <20261111154816.71103-12-pmladek@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 17:01:04 +0000
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
- [Low] console/braille: missing Fixes trailer for unlocked setup() call
--

commit b38dd583153412f19250e27165240271e50c6249
Author: Petr Mladek <pmladek@suse.com>

> console/braille: Lock console->setup() call during the registration
>
> In braille_register_console(), the console->setup() callback must be
> called while holding the console_lock. This prevents a race condition
> with a possible active boot console that might be using the same hardware
> registers.
>
> See also the commit 801410b26a0e ("serial: Lock console when calling into
> driver before registration").
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260423130015.85175-1-pmladek%40s=
use.com
> Suggested-by: John Ogness <john.ogness@linutronix.de>
> Signed-off-by: Petr Mladek <pmladek@suse.com>
> Acked-by: Chris Down <chris@chrisdown.name>

[Severity: Low]
This fixes a race condition in braille_register_console() where
console->setup() was called without holding console_lock.  Should this
include:

  Fixes: f7511d5f66f0 ("Basic braille screen reader support")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111154816.7110=
3-1-pmladek@suse.com?part=3D11
