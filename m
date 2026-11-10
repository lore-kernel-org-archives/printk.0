Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313902;
	b=vpHThR1rUsrSIxdbaWRuMi+AQiyPvCffzUt/gNABPYF0zR2u5qRf4pTrjZ2DP9WPes3P
	 O8wC9+r8EIGGNcAO9nhgS4NY108JH/qoHFUL/SFIVN6dEhO7h/z6ue4edMQGqKZJ2+i6d
	 LsoAmftrJUk13vaQGoMwQCg6EbdhzNhb/hRUugC2/3kriPwoTajqKfmDkkidTxStaXVs8
	 ZXC5MdKMR44aXIujdbTAqy+uNs5eBUI67CYqsBw70lZMGkjWX/6LlK8slgK2iUp8Rq5oU
	 oD9q2F/zI/K7w9XTqP6n3skkH7IRwAkKCo+R5umWHz95rWjIGF5fOpa4NckMVVhQzhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313902;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4OAO12T2PvetSDvW1yEl5YS4g8qNT+lonlZlp11tys0=;
	b=J5HoDQ9w1uNO4Jip0suFKu4gCeMiatIZXD6a1TBB6SztB64Lfd8ZCgwKii38g7OQnCFP
	 HfPN9meLM+5v324S0RGuLDvzjk5562+Vg0hgRRRSEnkK5BkpK58LPFH7LMAMpecmrfUlI
	 OjXdkXBjwhRPBrLHS+Rj7sf3Qn7ih9bC4TgZbVpeW/lVulywscrkPPakfkWSU0Barf0g1
	 bwk8COFhZONgpCmckLczbnIHE7tIOpSnKx5utpRcJIk2wezYTBQvcfwfxQSnG11SxeanZ
	 lLVfIsCGG3aUDgPxHJ+on4lbxMbsHoLIQ28hdfLultIQx6GrOIr1L8+y2+OwfSeRcXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IlNgT5Is;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5A0606A31C
	for <printk@lists.linux.dev>; Tue, 10 Nov 2026 12:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IlNgT5Is
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A57A51F0089F;
	Tue, 10 Nov 2026 12:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794313901;
	bh=4OAO12T2PvetSDvW1yEl5YS4g8qNT+lonlZlp11tys0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IlNgT5IstLnqy1Ha2xCgz6yazRSArF/pxdw+iil9zum7x1opcbVsl/E4ydPrXQ7yd
	 iv4flJCkTb7lE4UvLZ76kKLGngToJ8JRBMtCGhXIDbsvczl3g2uGFZcZgVcKvxYqVi
	 E8ogz0K98m5epXiCvzFiR2Bxoj/y0PBmtM1A0coC++3tA74kBbMW+TG66j4ZuZwpC6
	 s3U5P0uWVclT7QivERxVfH7JDeJQYc/T3J3COBvqqOZpLQJf2JYkbXoNBvRTZGkt9r
	 jOXooBZUUCkbeZcFKFJ6Dj3T2MWdwUKuxECdJ2khg7IN1SUhWAT0dDYJio0wbnch7a
	 1AXGknmg3Al+A==
Message-ID: <sashiko-outbox-207022@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH printk 1/6] printk: Introduce and specify flush reasons
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Ogness" <john.ogness@linutronix.de>, "Petr Mladek" <pmladek@suse.com>
Cc: "Sergey Senozhatsky" <senozhatsky@chromium.org>, "Steven Rostedt" <rostedt@goodmis.org>, "Ryan
 Roberts" <ryan.roberts@arm.com>, "Breno Leitao" <leitao@debian.org>, printk@lists.linux.dev, "Madhavan
 Srinivasan" <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>, "Nicholas
 Piggin" <npiggin@gmail.com>, =?utf-8?b?Q2hyaXN0b3BoZSBMZXJveSAoQ1MgR1JP?=
 =?utf-8?b?VVAp?= <chleroy@kernel.org>, =?utf-8?b?Uml0ZXNoIEhhcmphbmkg?=
 =?utf-8?b?KElCTSk=?= <ritesh.list@gmail.com>, "Shrikanth Hegde" <sshegde@linux.ibm.com>, "Andrew
 Morton" <akpm@linux-foundation.org>, "Feng Tang" <feng.tang@linux.alibaba.com>, "Jinjie
 Ruan" <ruanjinjie@huawei.com>, "Mukesh Kumar Chaurasiya" <mchauras@linux.ibm.com>, "Oleg
 Nesterov" <oleg@redhat.com>, "Pavel Tikhomirov" <ptikhomirov@virtuozzo.com>, "Bradley
 Morgan" <include@grrlz.net>, =?utf-8?b?Q2hyaXN0aWFuIEJyYXVuZXIgKEFtdXRh?=
 =?utf-8?b?YmxlKQ==?= <brauner@kernel.org>, =?utf-8?b?Q2VuIFpoYW5nIChN?=
 =?utf-8?b?aWNyb3NvZnQp?= <blbllhy@gmail.com>, "Petr Pavlu" <petr.pavlu@suse.com>
In-Reply-To: <20261109123127.489676-2-john.ogness@linutronix.de>
References: <20261109123127.489676-1-john.ogness@linutronix.de>
 <20261109123127.489676-2-john.ogness@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 12:31:40 +0000
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
- [Low] printk: missing @reason kernel-doc description for
  printk_trigger_flush()
--

commit 2671602433b21536db216fd234b44b9f5ac6b234
Author: John Ogness <john.ogness@linutronix.de>

printk: Introduce and specify flush reasons

This commit introduces enum pr_flush_reason and propagates it from
printk_trigger_flush() and atomic flush callers down to
__nbcon_atomic_flush_pending_con().

> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 5dbcf8a9909bb..ab9f2d6a6526a 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
[ ... ]
> @@ -4732,13 +4732,13 @@ void defer_console_output(void)
>   * This is best effort. Depending on the system state, console states,
>   * and caller context, no actual flushing may result from this call.
>   */
> -void printk_trigger_flush(void)
> +void printk_trigger_flush(enum pr_flush_reason reason)

[Severity: Low]
Should the kernel-doc comment above printk_trigger_flush() also document
@reason to avoid a W=3D1 kernel-doc warning?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109123127.4896=
76-1-john.ogness@linutronix.de?part=3D1
