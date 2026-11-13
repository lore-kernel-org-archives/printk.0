Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794529733;
	b=BNYvPhU1oyszDn8kwwSt3P/FzDID6RVNAb6R6UiWl4ElpRb74hVQCnHVFY/fKu33tBwE
	 jS8l+ObBiV1mbTsafzWlJYsyYngMGFzs8fVhvG3JZlD0FLPUOYVsNr1m9EVVMphVlLlWt
	 F8W4AZC9L9qD+2uFp4spaf3+dBHZ9P5f7y9F8KwB89um5NgOWJ15A+0QjA8gUvpoXDoKW
	 bMCpFNbdeA+1eHUN/cinkxgcqNhsU9AhXHmxsnc8tlhq+Xjs9Q/ZMe69OACLuIGbmSYKC
	 Nf7vV3OTrkpbF3VaWfIudc0tnuTupO9TrJKpKDsQmMmJv8XLuY2vjKcVl4ZFcXp6Fhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794529733;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fK+rb5IQqFR+sNxfZGQoHSrziBoA/4zkBxISg1NppaQ=;
	b=kBdfOzIhvWkqh1we+URq/9JIQHMk9HMlhnDKHHH0ukLUj5G74Tyn01AMNZEVtX/YI8Pz
	 j0EMGKNk1FpP3VSBvfjYfXAxdFukHX+TxHiLY3Of6j7kQEUlVem607gXDkilk/XVtvaf7
	 IolFwc37YHQbdcsfK9F2bcvm/0xRG4MZ82tmTcRxEg0s1u/EHJ4dMDpbefRbaB71Ko6YI
	 eX/Mp3q5rcIfzXlNmKE89jSIKsH7PSfMGGWBA8cDkWGs+sJz2Ot40wCmooyDqpMYJN3sw
	 mSKSePzqPHh956meOrbnEErwp22ddTpL4Fs5LQT37mIccmiqkFXRm/r3d+Dj5TlwLSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IqTux1fY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E3D606A31C
	for <printk@lists.linux.dev>; Fri, 13 Nov 2026 00:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IqTux1fY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F4171F000C4;
	Fri, 13 Nov 2026 00:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794529733;
	bh=fK+rb5IQqFR+sNxfZGQoHSrziBoA/4zkBxISg1NppaQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IqTux1fYTBIDXI60rKgCZfECHRkk25ShcPYi4Ts826RpBy487SFzjFRJQeDdDXBCL
	 kQQVmf7mvnOy1uM8SjY4zEHmyWDHEGjqrM6UJXlJqtljLwIQFVGV5RGjMvX/B1qR+4
	 iBGMISsf8qWVKMHv4m5R8YzJTi4zq68ElIrNYc8lJFvC2JgKiJL0aY55hutcLidaOm
	 J+FLssTQHByKS2pW9J/H9mkLalvw9gmna6rssHmTY10yZGDzljrGDyP2VGwoGi/uE5
	 qHDZr/rcoINeJq3520SBghLfSBJ7stYs2GgEOhGsBYNHVZSnFHxXskuXE6yM2DGNNa
	 ixP+M4WemFIXQ==
Message-ID: <sashiko-outbox-211999@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/10] kernel: fix duplicate extern declarations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Safocl Stollmannovic" <safocl88@gmail.com>, "Peter Zijlstra" <peterz@infradead.org>, "Ingo
 Molnar" <mingo@redhat.com>, "Will Deacon" <will@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Waiman
 Long" <longman@redhat.com>, "Petr Mladek" <pmladek@suse.com>, "John Ogness" <john.ogness@linutronix.de>, "Steven
 Rostedt" <rostedt@goodmis.org>, "Sergey Senozhatsky" <senozhatsky@chromium.org>, "Rafael
 J. Wysocki" <rafael@kernel.org>, "Len Brown" <lenb@kernel.org>, "Pavel
 Machek" <pavel@kernel.org>
Cc: printk@lists.linux.dev
In-Reply-To: <20261113001432.128201-11-safocl88@gmail.com>
References: <20261113001432.128201-1-safocl88@gmail.com>
 <20261113001432.128201-11-safocl88@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 00:28:52 +0000
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
- [Low] kernel: corrupted commit message with missing tokens and stray
  echo
--

commit f73fa4a4d8220fded4eb560a5d2a660e6a183925
Author: Safocl Stollmannovic <safocl88@gmail.com>

> kernel: fix duplicate extern declarations
>
> Compiling a kernel module with a C++ compiler results in a duplicate
> echo =E2=80=98extern=E2=80=99 specifier error.
> This occurs because the code contains , and
> expands to  when processed by a C++ compiler.
> The  specifier must be removed.
> https://bugzilla.kernel.org/show_bug.cgi?id=3D222257
>
> Signed-off-by: Safocl Stollmannovic <safocl88@gmail.com>

[Severity: Low]
It looks like shell command substitution stripped the identifier names
(extern asmlinkage, asmlinkage, extern "C", and extern) out of the commit
message and inserted a stray "echo".  Also, the Bugzilla URL should use a
Link: or Closes: trailer instead of a bare URL.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113001432.1282=
01-1-safocl88@gmail.com?part=3D10
