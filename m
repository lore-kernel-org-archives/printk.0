Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986206;
	b=PgN//2VXX9AhvDzCyOXJBD65cDiw5wF5cGNwSZVfIasRs8JY8QwptOUSgZ1U9l0jzsg4
	 yJb3LA4A4+cWaZZgWpVG71mefAhewSn4yJ98jpqFuxa5bGWtpyyrwVctW1s0YqFk9epEc
	 QLN1JKivev+O1FCRV6qfiMHf7yyk3JzAAKgxXPBhAEyTft1SzLnrYjz7b5pKDneK2kuaC
	 8PwIBzp6goP8d9CGES0htdlvD/aZwT2UcesIwI2PH4zcGIttsDGD0j8X1oMdl7V7qurpg
	 mekVMLw7W6pdM4dTd/sMHA10BGVo7O/Qup47tpSqR2sYlsz++HKG3Sh/qYoPZcfK7PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986206;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mfpjSuZNoTiJCTBF/GzycGMhoKnkdsUk8IJNldM4TU4=;
	b=cx7ZExq+NaueuSAphEbrlZkHWYl2ibKXRYdi+/GQDMBEIg9yd+KNpl7+9X7ump+HmK6a
	 7CBEZyBduYbCO1241SDtKPZ49XVRXa3V/sWhzesH28cxvu1SXG/F2VFMf+wpUZPrr17dV
	 /W+iX3DfdUsl7oS6wQmqEiw80YR6WedQuPBMBxRydzITSIOSM3YBSmyRZAG6JVJ2WYHL9
	 t5LONYHQxKnvTkJKIEv7BEBsfjfoG2ukyR2JXkixraNtQ1ewJmlm6DlCQIdiiDFKQQAfI
	 8mkSPQRzyxydQKuqeBk7yHofOemhqqhacP/1EQ1g/vvXc7IsZ181sIdgn7gfdnNbftA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ckWTNY81;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB809606A32C
	for <printk@lists.linux.dev>; Fri,  6 Nov 2026 17:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ckWTNY81
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 679411F0089F;
	Fri,  6 Nov 2026 17:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793986205;
	bh=mfpjSuZNoTiJCTBF/GzycGMhoKnkdsUk8IJNldM4TU4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ckWTNY81WmKxibAeJmSYFSQauConH+2st1U62k29PTUrivCkvSmNgZLmj+dy6GG5Q
	 ad0oqA0yUrHEPcDQXBjzC1dNghuKWfgLg4EVLGzkclUPwffZnyVBZxCMV3ZJFoP8x0
	 YHf69x4ujwgvD8M2LXaUA14WulDl2A5U3jtjqh6Kh0qnbS9uwGpIjbEx2sq1FKUvs0
	 BzFARCZSq9gMKZ2PaMs//nj1wZb7v980/R/SDvGFcnm3EKsGomUR1GZdA/DUAGofgp
	 V+awgfVgnsmVoYRrrqyDZLETWWobY4fcQJWU8jhyhdU4bx8gRl+5QF5j1YEjb9CcRV
	 YZKBjP5P4w9yw==
Message-ID: <sashiko-outbox-201935@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 04/16] printk: Separate code for adding/updating
 preferred console metadata
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petr Mladek" <pmladek@suse.com>, "John Ogness" <john.ogness@linutronix.de>
Cc: "Sergey Senozhatsky" <senozhatsky@chromium.org>, "Steven Rostedt" <rostedt@goodmis.org>, "Marcos
 Paulo de Souza" <mpdesouza@suse.com>, "Chris Down" <chris@chrisdown.name>, "Naveen
 Kumar Chaudhary" <naveen.osdev@gmail.com>, printk@lists.linux.dev
In-Reply-To: <20261106171952.207909-5-pmladek@suse.com>
References: <20261106171952.207909-1-pmladek@suse.com>
 <20261106171952.207909-5-pmladek@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 17:30:05 +0000
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
- [Low] printk: malformed kernel-doc comment for
  add_or_update_preferred_console()
--

commit 53283e23ffd138683d26af82f710d22a050dc49e
Author: Petr Mladek <pmladek@suse.com>

printk: Separate code for adding/updating preferred console metadata

This commit splits the logic for adding or updating a preferred console
entry out of __add_preferred_console() into a new helper function,
add_or_update_preferred_console().

> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 27bf77a777a2e..24bb6f63c070a 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
[ ... ]
> @@ -2543,26 +2544,34 @@ asmlinkage __visible void early_printk(const char=
 *fmt, ...)
>  }
>  #endif
> =20
> -static void set_user_specified(struct preferred_console *pc, bool user_s=
pecified)
> +/** add_or_update_preferred_console - Add or update a given entry in
> + *	the preferred_consoles[] array.
> + *
> + * @i: index of the entry in @preferred_consoles table which should get =
updated.
> + * @name: The name of the preferred console driver.
> + * @idx: Preferred console index, e.g. port number.
> + * @devname: The name of the preferred physical device.
> + * @options: Options used when setting up the console driver.
> + * @brl_options: Options used when setting up the console driver
> + *	as a braille console.
> + * @user_specified: True if preferred via the kernel command line.
> + *
> + * The function adds or updates an entry in preferred_consoles[] array. =
Also
> + * it updates some global variables which are used to make the right dec=
isions
> + * in register_console().
> + */
> +static int add_or_update_preferred_console(unsigned int i,

[Severity: Low]
As reported by Chris Down on v5 [1], scripts/kernel-doc requires the opening
/** marker to be on its own line, so placing the function identifier on that
first line causes the parser to skip this kernel-doc block, and it is also
missing a Return: section.

[1] https://lore.kernel.org/r/auLwTYSza9exX3ba@chrisdown.name

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106171952.2079=
09-1-pmladek@suse.com?part=3D4
