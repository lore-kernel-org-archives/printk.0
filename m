Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986635;
	b=ZWndmNGC8bpHp3fqDVBtJPW2hsE6Fw2eNmxvLTws/iemx4wIpHngzPdCbyIsEN4AbeB/
	 k8ujpA/s+ZLXPt2AXHD5QE9kyt+jq4ivQlVtwkBn0RcDK18HQpC/wROOntBTCkvQ1EFiM
	 8+Ygm4FAEpsMotmwTVgEiygmIR4IITMQ7/aRnMeEKWSqqpTcfSqr5AprUDyWgKf64oqAE
	 ln7sZJy9fCRbLGrKqLACl9sxR7zRAidSUjmcPyGzRXYmIwvZrX6VGzVCBq6QxzrcrhOPt
	 1esJ1I7ekNLceTzrvPTu+HOsvOsEgkoHxGhFq1OutOhRjtC4fyhKafNANkus+2Bdtcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986635;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=l6gu/gCuxP9DfpaJz3ThgW6y4HNLvcWckzd3FpXCtg8=;
	b=VmUhcIgO+07eXm4MOL9sPFMneOZs5eBNouDdaT7lSOv2YSF3hLQ8z7PetJTEr3VdkgP2
	 cYVdLXOMYwkyh1dun96pkaCJNqzgro1mdSMOHUASy2xWeqCFvevcvnbq6KaY9eah60XIE
	 xsylXEbPp49mn+y3A0vn3hm8p3y3kFJMYqOAYmjnBiet+GLkDmXxEn5TRK10MBSjpJ0sw
	 hL8YZ0/GR6yVff/MsPIjWVhTKBvIt3IVO0Qf+x4caaXaCFdNRU62eKFzfQDYBlvDRapuj
	 XmTJj7V0PB58eVVcSG63h6Hv0e3dGeAw9GkJo1GdyUVf+8OS1mvVK58uVRCdtfKgKUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nz7wtM1X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1167E606A32C
	for <printk@lists.linux.dev>; Fri,  6 Nov 2026 17:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nz7wtM1X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A43D1F0089F;
	Fri,  6 Nov 2026 17:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793986634;
	bh=l6gu/gCuxP9DfpaJz3ThgW6y4HNLvcWckzd3FpXCtg8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nz7wtM1XZfP/qQ3OYthl03cwlFnML94YmbMdp9ec3LO6UmEyrHQGiyuPLQu6Yn15E
	 lEnEOc99spc46bzv8WsbboRJ4GEN/kYwcn9GKPbMoK9tzZQLpuXYD+U8OnSEERJRIh
	 jQoDdPEj6LveEm0fYICfJlAcdLoL3ZVi0OcRWRFE2e3ku2JJgZEJcmlt+aYgJJcVfR
	 kd7vRxG87HlxVf5BfxaoTehZZU2bk7/lbwwkTx81aH3lXYMG9Zyc87JVl6V6X9jUNi
	 q4m4A8oBXiAuEuxaZQzLcUegYT0W9FCyAgfgiGgP7Q/isH48T7lhnZkGLSENGFjECh
	 ZG3KqdQC+FSSg==
Message-ID: <sashiko-outbox-201951@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 08/16] printk: Ensure consistent name and devname
 when updating preferred console
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petr Mladek" <pmladek@suse.com>, "John Ogness" <john.ogness@linutronix.de>
Cc: "Sergey Senozhatsky" <senozhatsky@chromium.org>, "Steven Rostedt" <rostedt@goodmis.org>, "Marcos
 Paulo de Souza" <mpdesouza@suse.com>, "Chris Down" <chris@chrisdown.name>, "Naveen
 Kumar Chaudhary" <naveen.osdev@gmail.com>, printk@lists.linux.dev
In-Reply-To: <20261106171952.207909-9-pmladek@suse.com>
References: <20261106171952.207909-1-pmladek@suse.com>
 <20261106171952.207909-9-pmladek@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 17:37:13 +0000
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
- [Low] printk: cross-type update corrupts entry in
  add_or_update_preferred_console()
--

commit dac2f22b5af57f05f13a7369b2af922602449749
Author: Petr Mladek <pmladek@suse.com>

printk: Ensure consistent name and devname when updating preferred console

This commit adds validation in add_or_update_preferred_console() to check
that existing preferred console entries match the provided devname or
name and index when updated.

> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 26fab79c32c4b..ba644a0650910 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -2564,6 +2564,8 @@ asmlinkage __visible void early_printk(const char *=
fmt, ...)
>   *
>   *   2. Either @name and valid @idx OR @devname and @idx=3D-1 are allowe=
d. [*]
>   *
> + *   3. Only matching entries can be updated.
> + *
>   *  [*] A valid @name and @idx will get assigned for a devname later when
>   *	@devname matches during the device initialization, see
>   *	match_devname_and_update_preferred_console().
> @@ -2589,10 +2591,7 @@ static int add_or_update_preferred_console(unsigne=
d int i,
>  		return -EINVAL;
>  	}
> =20
> -	if (!pc->name[0] && !pc->devname[0])
> -		is_new_entry =3D true;
> -
> -	if (is_new_entry && devname) {
> +	if (devname) {
>  		/*
>  		 * A valid console name and index will get assigned when
>  		 * a matching device gets registered.
> @@ -2608,11 +2607,18 @@ static int add_or_update_preferred_console(unsign=
ed int i,
>  			return -EINVAL;
>  		}
> =20
> -		strscpy(pc->devname, devname);
> -		pc->index =3D idx;
> +		if (!pc->devname[0]) {
> +			is_new_entry =3D true;
> +			strscpy(pc->devname, devname);
> +			pc->index =3D idx;
> +		} else if (strcmp(pc->devname, devname) !=3D 0) {
> +			pr_err("Updating a preferred console with an invalid devname: %s vs. =
%s\n",
> +			       pc->devname, devname);
> +			return -EINVAL;
> +		}
>  	}
> =20
> -	if (is_new_entry && name) {
> +	if (name) {
>  		/* A console name must be defined with a valid index. */
>  		if (idx < 0) {
>  			pr_err("Adding a preferred console with an invalid index: %s, %d\n",
> @@ -2620,8 +2626,15 @@ static int add_or_update_preferred_console(unsigne=
d int i,
>  			return -EINVAL;
>  		}
> =20
> -		strscpy(pc->name, name);
> -		pc->index =3D idx;
> +		if (!pc->name[0]) {
> +			is_new_entry =3D true;
> +			strscpy(pc->name, name);
> +			pc->index =3D idx;
> +		} else if (strcmp(pc->name, name) !=3D 0 || pc->index !=3D idx) {
> +			pr_err("Updating a preferred console with an invalid name or index: %=
s%d vs. %s%d\n",
> +			       pc->name, pc->index, name, idx);
> +			return -EINVAL;
> +		}
>  	}

[Severity: Low]
As reported by Chris Down on v5 [1], does replacing the combined
(!pc->name[0] && !pc->devname[0]) check with separate !pc->devname[0] and
!pc->name[0] checks allow a cross-type update on an occupied slot to
corrupt the entry instead of returning -EINVAL?

If preferred_consoles[i] was added by name (so pc->name[0] is set and
pc->devname[0] is empty) and add_or_update_preferred_console() is called
on that slot with a devname, !pc->devname[0] is true.  It treats the
existing entry as new, sets pc->index to -1 while pc->name remains set,
and overwrites pc->options and braille options.  The reverse also happens
when a name update hits an unresolved devname entry where !pc->name[0] is
still true.

Keeping is_new_entry =3D (!pc->name[0] && !pc->devname[0]) and checking
if (is_new_entry) before the strcmp() branches would reject both
mismatched updates with -EINVAL.

[1] https://lore.kernel.org/r/auLxQDWkHLV01D1t@chrisdown.name

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106171952.2079=
09-1-pmladek@suse.com?part=3D8
