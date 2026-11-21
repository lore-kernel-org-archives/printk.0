Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795278967;
	b=s3KyVgSAFyLJP+gVOCVFdiKeo4RkG27HWp3ZGxXuRUgnGkZcZWECGaO1N5F0/tE6d0bx
	 LUaHWMcPDn8prKrk7MMmKBHtCdfq7tbRKHjOcNpnWfm1QL6W7jA1jVeSTkCnzFSIKDGbQ
	 hhocsNPiXzRGwkA9ks2v3Kg/rHMDsI3vUF2uBk8ghRiKMqWgPb+yf+hvfomMGY11hoPhy
	 hu1RNvhGHi0pgYvePQlwM0vmO2u5slI5U63YGcK0ntTk2yADh3RnPpGoKMO35FMA+yyQX
	 KINggLYe4Hzta831iu/IdldeAMf8/8T4fhj3bgcDTIlYbxGb1O124cm+K2Q1oKQ2WFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795278967;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=gsY52QypeM8c+C0yp8+SKsiWC6bxLPvGiy93DlD6Rc8=;
	b=TME7md/KH0/3VfVqNcJkOdzwceHNnX47iO3ADOrxuEvp55LTtYs8aaelmdB02PQMP3Vt
	 iU4MPq6R3cYA51eiU4vb04YZipAnc8SVTGBNXayuMgpaFhSZI8T+OdyiMWDCFLrHDlviX
	 wu7Q3b1rIBi10oLjwhPPTAhYy5ESnyEfinOlHNLokeZVDukaDNOqNxJYL0iGe7CQx8s6J
	 r0ceKL/Lcnfiq0jD8FcV0ZhYAEPKk41ckvH08f6aAmju8FF/+HVKhFmRl86exuohouNTf
	 9DcE+S6IKPXuMsJ3QRA63zwYC/voyZQxp86WfFGXPzNmnVaB5xq+U6gNayd/99IiEGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=BCL39XsV;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=0iwsuRgQ;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54405606A330
	for <printk@lists.linux.dev>; Sat, 21 Nov 2026 16:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54405606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=BCL39XsV;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=0iwsuRgQ
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795278959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gsY52QypeM8c+C0yp8+SKsiWC6bxLPvGiy93DlD6Rc8=;
	b=BCL39XsVRlrz6KdxJFHHebR55BJvQHoCt8ZxPc7K8/ttdBwSNTGCtlptjA1cW4BY0+wBj4
	RH3WLbAaHmM0H+2IWsKQLwMcfFUzA6JTDaNt1T4rz01Ts6WJzvfd4Jp3POKAPsertmLMRM
	tzkAS+Hp3MRejMVTPR7dq4F2uwEdJiRQLcw4h3GZM5cxk5FJ8f9CrM+Fa49IHe/1hd9UWl
	zovlcNHQyrda5Ck/Kmhlmymz+vNuccTIuAJ+4mMVYWU+8YseGXDKwBNtZT4AWGHRvUSP5M
	zCM6eiVmVszGQdEr3HHzvsin4z6Blo74uU5/QX2ZdrxPsyrwKvzDn/ijzTq4/A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795278959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gsY52QypeM8c+C0yp8+SKsiWC6bxLPvGiy93DlD6Rc8=;
	b=0iwsuRgQbQpmYxaVF/OaVWMavCV4vkXiwwuaaTU6NvadceOzaAC4RhVgvi9Bx+KiHBoRIo
	2JY6r0MKGTTfSzBQ==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Rio <rioo.tsukatsukii@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bradley Morgan <brads@mainlining.org>,
	Pnina Feder <pnina.feder@mobileye.com>,
	Alessandro Carminati <acarmina@redhat.com>,
	Gal Pressman <gal@nvidia.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Bradley Morgan <include@grrlz.net>,
	Alex Elder <elder@riscstar.com>,
	"Cen Zhang (Microsoft)" <blbllhy@gmail.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	kexec@lists.infradead.org,
	Gustavo Luiz Duarte <gustavold@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Subject: [PATCH printk v4 0/8] Introduce policies for unsafe flushing
Date: Sat, 21 Nov 2026 17:41:48 +0106
Message-ID: <20261121163557.963029-1-john.ogness@linutronix.de>
X-Mailing-List: printk@lists.linux.dev
List-Id: <printk.lists.linux.dev>
List-Post: <mailto:printk@lists.linux.dev>
List-Help: <mailto:printk+help@lists.linux.dev>
List-Subscribe: <mailto:printk+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:printk+unsubscribe@lists.linux.dev>
List-Owner: <mailto:printk+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v3 is here [0].

Until now unsafe flushing is only performed at the very end of
panic(), before entering the infinite loop. For other situations
(such as panic-kexec or panic-reboot or emergency-reboot) no
unsafe flushing is performed. The reasoning for this is because
an unsafe flush could lead to fireworks, which could prevent the
kexec or reboot from occurring.

However, some users may be willing to take on such risks in order
to see panic output. Indeed, for the netconsole (which does not
support safe atomic printing) it is a regression that such unsafe
printing does not occur. [1] 

This series adds unsafe flushing policy flags per-console to
allow individual consoles to perform unsafe flushing for such
scenarios. The unsafe flushing is hard-code-enabled for the
netconsole in patch 8/8. The justification is that this is not
less safe than the legacy netconsole.

Later these policy flags could be easily exposed to userspace
via /sys/class/consoles/, once the sysfs per-console interface
is available.

The first 5 patches have no functional changes.

Changes since v3:

- Restore WARN for non-panic hostile takeover attempts and
  expand the comment so I don't attempt this again.

- Rename nbcon_allow_unsafe_takeover() to nbcon_allow_unsafe()
  because it now allows general unsafe usage and not
  specifically hostile takeovers.

- In __nbcon_atomic_flush_pending(), additionally use
  panic_on_this_cpu() to determine if a hostile takeover is
  allowed.

John Ogness

[0] https://lore.kernel.org/lkml/20261118230345.808560-1-john.ogness@linutronix.de
[1] https://lore.kernel.org/lkml/20260915100140.3631650-1-ryan.roberts@arm.com

John Ogness (8):
  printk: Introduce and specify flush reasons
  printk: nbcon: Move unsafe takeover check to higher level
  printk: Move unsafe takeover check out of console_is_usable()
  printk: nbcon: Use @reason instead of global variable to check flush
    policy
  printk: nbcon: Expand unsafe takeover check for general unsafe
  console: Support unsafe flushing for panic/emergency restarts
  printk: Add unsafe flush points for panic+kexec and emergency_restart
  netconsole: Perform unsafe flushing on panic and emergency restart

 drivers/net/netconsole.c |   2 +
 include/linux/console.h  |  60 +++++++++++++++++-----
 include/linux/printk.h   |  20 +++++++-
 kernel/crash_core.c      |   1 +
 kernel/panic.c           |   2 +-
 kernel/printk/nbcon.c    | 105 ++++++++++++++++++++++++++++-----------
 kernel/reboot.c          |   1 +
 7 files changed, 147 insertions(+), 44 deletions(-)


base-commit: 52904cd86a5f8c83fd956d1b2b9cd12593597e7b
-- 
2.47.3

