Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794507611;
	b=VN9PmIb1LGDNyhxl4wKq2xov0ZXlE5dYfL+IttsoquOs2uGSUJeK43mG1ASKB+SBS6yz
	 1N/IrJ7J7NM2JqcSh+TeWUgXmfjKy7lDsJTu85yYJrOyoob3ep9T/cM03rQp8/3X4LZy9
	 kY6W76n1VHr/HNtzy5uKedAAs4PWIDdJoZyufnTofC5GHze0Vo1QxMpngK2JEE9ML0QSk
	 7AlrK29+RKy68aBvv+2r126g4FFdQaDaMRQ83Wer6szT3DXsxbXNta9l/SLWIgbAPewrA
	 g7awkl1a/5qjvv32hweZXYs332Xprz6PVS7XJDmrMtV2lI++vgBiVSby1Pvl6FW51sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794507611;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GJ09uqYjRVaCurMfukDMPp2A0M6HiGjs+X7y4PKg5Dk=;
	b=lHmguS7nxu0GSp6uFIpwXpsFzz2HIHoYeOyEqZJd1UEeNyGkVAdI83zEiDv9n0bgapvC
	 LWdkTk3tbHrvrA6cxjpKBgUQ5isbkfEQefh5qszcVAo0vguCL8fuwpRUSDXu0ffQdx0EN
	 +HSb5zGm4nC0gy2vZbZqlQv2/okbkYTViep1qD7YqrBeBCBWnEuGdw5NGkdunZEbRU7de
	 Xt0FBNamaXnOFt/z+HEGOBYK+1ksFf0Yd+YXz7ZqmZT+X9dincnZQYVste92Gmm1cO8Fl
	 gbCq5nttzRg3KV4oiz3mwl3dSuZcEdQUXGSCke7Au5gROzEyzcl3Q/gDFqnQJ2Qn5ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ZSwYdb/H";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD41606A31C
	for <printk@lists.linux.dev>; Thu, 12 Nov 2026 18:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZSwYdb/H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F93D1F000C6;
	Thu, 12 Nov 2026 18:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794507611;
	bh=GJ09uqYjRVaCurMfukDMPp2A0M6HiGjs+X7y4PKg5Dk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZSwYdb/Hyvb8grs1F5+3mmMgLNeae+GNQMMWDxEYa9DSdD7SCV7I6WWtYklhl2F4I
	 YhQt6q02MED9bO7no+rxfZ/gr/r4Zq2d6o0sbrWRL5AnfbInFIPE9dOpY34tDwvdW5
	 HcVx3+Jp/n9GxEbdovvdtd4GTbh+LKzYzJDVkp7OfMo3QDN/iY/vL4q+64F8T4sGbK
	 i3kTneLjTl0aw0cEmUkXVej/y27g68TYmas3QETNZmYc3R0D2D9o8q3i8Gr1NmmnPN
	 ++gzRFX3xNqW9osdPQ5pTJvcYG8C2l2YmXTtHZwvrd/SbeJxhBFvpLXqfdE3dV/IzM
	 VrtSiVBA87luQ==
Message-ID: <sashiko-outbox-211696@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH printk v2 5/6] printk: Add panic+kexec flush point
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Ogness" <john.ogness@linutronix.de>, "Petr Mladek" <pmladek@suse.com>
Cc: "Sergey Senozhatsky" <senozhatsky@chromium.org>, "Steven Rostedt" <rostedt@goodmis.org>, "Ryan
 Roberts" <ryan.roberts@arm.com>, "Breno Leitao" <leitao@debian.org>, printk@lists.linux.dev, "Andrew
 Morton" <akpm@linux-foundation.org>, "Baoquan He" <baoquan.he@linux.dev>, "Mike
 Rapoport" <rppt@kernel.org>, "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Pratyush
 Yadav" <pratyush@kernel.org>, "Dave Young" <ruirui.yang@linux.dev>, kexec@lists.infradead.org
In-Reply-To: <20261111181942.593695-6-john.ogness@linutronix.de>
References: <20261111181942.593695-1-john.ogness@linutronix.de>
 <20261111181942.593695-6-john.ogness@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 18:20:10 +0000
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
- [Medium] crash: printk_trigger_flush() in __crash_kexec() called with
  wrong panic_cpu
--

commit fef7b57cf45508b52c2322cc5354dee7d0cedbc1
Author: John Ogness <john.ogness@linutronix.de>

printk: Add panic+kexec flush point

This commit adds a call to printk_trigger_flush() in __crash_kexec() to
allow consoles with the panic flush policy to flush before booting into
the crash kernel.

> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index d0bd2d0cf8990..064b0af903c38 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -140,6 +140,7 @@ void __noclone __crash_kexec(struct pt_regs *regs)
> =20
>  			crash_setup_regs(&fixed_regs, regs);
>  			crash_save_vmcoreinfo();
> +			printk_trigger_flush(PR_FLUSH_RESTART);

[Severity: Medium]
Can printk_trigger_flush() be called here on CPU0 while panic_cpu still
holds a non-zero CPU number or its invalid initial value?

On Hyper-V root partitions, crash_nmi_callback() parks all non-zero CPUs
when a panic occurs on another CPU (or when the hypervisor itself crashes
with panic_cpu unset), while CPU0 disables the hypervisor and calls
hv_crash_handle() -> __crash_kexec() without updating panic_cpu:

arch/x86/hyperv/hv_crash.c:hv_crash_handle() {
    ...
	/* we are now fully in devirtualized normal kernel mode */
	__crash_kexec(NULL);
}

Because panic_on_this_cpu() is false on CPU0, nbcon_get_default_prio()
returns normal priority instead of panic priority.  printk_trigger_flush()
then skips atomic panic flushing and takes the offload path via
defer_console_output() -> irq_work_queue().  When the local tick is
stopped, raising the self-interrupt calls hv_send_ipi_self(), which
invokes a hypercall after the hypervisor has already been disabled,
faulting and aborting machine_kexec().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111181942.5936=
95-1-john.ogness@linutronix.de?part=3D5
