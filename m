Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795630401;
	b=WON+C9FNf8a6DZfxv4hAqOUVXslW5wUfxVtNFGw9LYAYH46t9gJuxFvuiMEmtKalHvxF
	 4Kd463DZ/KprA2/cY7Gh0O/R9eeKPi3BZew3xnQRb5TeLP6M0y0CD2kgqjsbZQWwiYQvT
	 KuEGMasGgWQsOowOxZeK+jYjh/29QfPPLdDYIFD4CV5YwkZFtxICISKp9TI70Fk0dEWg5
	 2kifJWSglZ4tcgjGGnwAHi1MqiicoCKLBRXNQ4hk0MTcQcqiO1bK3mdnxtgjisAMQ0aA5
	 +I92YWE2CiSTKgZUCr7LO8HwJXfjsQ1YSkNoye/7LxxToB5WfjCHhFfYtxv4aF0HMFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630401;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=UeNJhwwhfT1HCiqhv3FhNp58XyyzHYExwIezY8M+DFg=;
	b=kgkuksDafCLy6EDfVGLrJ6lru7rDqYByrAksvsfxXQ/+SStifmS84xIpFRnDTu3y1bZf
	 KftxBnG4tJSBGcl7/LyOGkl69I9RXZKs0QgvQ9d8sZfVBlExN5WsV3+0fDK+iwQ7RLZrU
	 17ZGvNMBTCBw9BLOkELsJG6uDsvTO7lLKlWHmebvk/BrNFEdQwYzu3z//UPjcrfVjdaVR
	 tRWGfU+y10UwfXyr4OanRhcEnjWiE70hDlwBpLD6S5fR2xZIJawPHhUSu3uOTM75b7vyW
	 rxzYKp69MJjxRUomzNgE3M2vmzB3oqSLhMEn5+7XA2qaH4xdd4yiER8FgKAFRojNwvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NZpbYVmQ;
	arc=fail smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA23A606A33F;
	Wed, 25 Nov 2026 18:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NZpbYVmQ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795630401;
	b=zpQ+NJm6Drc/aN48Ggz61llZLeC4HDriJbCdPXVLX4M+0JJqFMvMniAAOhhLrCEUXBTa
	 2wKw23U/60OOesMK68PVemACi1WEweBYF4HOWex/gnkJxKg9ZfEbd8VQVcQ7kB7DpdNQB
	 KqwwXF9zObPE+dq3HL28ve6gaaa7rnHtEF/dlxupFRipY7ebUfI7mJWIbvlQha/SEStU7
	 9WvYdBeXsx7Wma0FfP8mRumWFzxEUarWD9v4SG7462ndJY0PvoRGBYI71qGfTsiinUfkF
	 mobK4431y5jlxi4pBQUcBu73yKnTFw6Z4WygqMXxW5hZzjRER69pOlOsTVMUzJNwKJw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795630401;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=UeNJhwwhfT1HCiqhv3FhNp58XyyzHYExwIezY8M+DFg=;
	b=L9Fzsx4AMkhI280ieToi0y4SP1RGgRmbWWXLReaHqGyrToYJOJs5eiwfzdwQHl71ZWcG
	 QNhnUeQ87mwvH11FoNQBtGO+kMJsEtrYk9qhqNgLZvwVQkfYKqqupIs+5rN6x3F8kMvgN
	 x49iiLrpowtasmeMhvrT++yDPPack6ApYkomkKMkz378HtESNhsnfXjTZUgsedChNaQSx
	 vITQnEErlxSx1AdymDAAxyiZjdo6OKga9loXwRBQ4DOo6Gprn1yfD9tTrZ5hKqHsQCv/P
	 gcvb1JL5CG3tzGGl5iAam2Se0UJiUuYA+9Z/sCirNbafuFrWWcEwmZI6+MGY4OmEHKQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 828E01F01572;
	Wed, 25 Nov 2026 18:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630401;
	bh=UeNJhwwhfT1HCiqhv3FhNp58XyyzHYExwIezY8M+DFg=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=NZpbYVmQHLif78kwcn/MM31kYV6j7MvXWHg2KNb14bIzn33/cFaxZ2G35qwqkA+Mk
	 k3Tm/AkGBc3aJoRHmM9Ff96ZC6cZ3XCztdojgNGyWg/V6NiBs2u0BE/vELMZwbZn5z
	 jyNQHdHmgDGHvhsCmFUUdXf2896NIVoX1wSOWh5KmOMrfD57oPauXqlidPWh+me5is
	 iZLrKMvg6q18tmMNdVU4HXP6V/HaBwhp9672fSac77Hr4O7gAAzAUWJRm00Pk7Oy89
	 djecJLNAxF6dgf5Rc4vxr0p4yBtRm1IQxEYcFeDve2kD+BMKodGSfa7uhO3xTtriOZ
	 e9oXeNkwfHKuw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EADE44CF69;
	Wed, 25 Nov 2026 18:12:57 +0000 (UTC)
From: Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org>
Date: Wed, 25 Nov 2026 11:12:53 -0700
Subject: [PATCH] printk.h: fix overzealous pr_fmt in pr_debug_ratelimited
X-Mailing-List: printk@lists.linux.dev
List-Id: <printk.lists.linux.dev>
List-Post: <mailto:printk@lists.linux.dev>
List-Help: <mailto:printk+help@lists.linux.dev>
List-Subscribe: <mailto:printk+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:printk+unsubscribe@lists.linux.dev>
List-Owner: <mailto:printk+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261125-pr-fmt-v1-1-3ff6832f5a50@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MQQqAIBAF0KsMf52gglFeJVpYjTWLLDQikO4e9
 A7wKgpn4QJPFZlvKXIkeDINYd5CWlnJAk+w2rbGWKfOrOJ+KRMm3XcuxhAYDeHMHOX5o2F83w+
 DeFh9WAAAAA==
X-Change-ID: 20261125-pr-fmt-1ab0985ffaae
To: Petr Mladek <pmladek@suse.com>, John Ogness <john.ogness@linutronix.de>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Jason Baron <jbaron@akamai.com>, Andrew Morton <akpm@linux-foundation.org>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: printk@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Philipp Hahn <phahn-oss@avm.de>, Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795630377; l=3384;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=uOvWjbH4KvP4BQLaAj5dHyvqdupRAiJBag5rGoYC/rU=;
 b=YR0qTxKl9oZCoqySBkW/7EM5j+ArZb3giU7KjThUd6isgDvVbW20zFhOZRXDD+7HE4sSEjDi0
 dFwdOthk8+sC7F2h0pAhZjmm9WGHdnf+NUdCa/muL/xrs7414BkplXI
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=
X-Endpoint-Received: by B4 Relay for jim.cromie@gmail.com/20260203 with
 auth_id=958
X-Original-From: Jim Cromie <jim.cromie@gmail.com>
Reply-To: jim.cromie@gmail.com
Content-Transfer-Encoding: 7bit

From: Jim Cromie <jim.cromie@gmail.com>

Historically, the CONFIG_DYNAMIC_DEBUG implementation of
pr_debug_ratelimited() passed raw fmt to both metadata and runtime:

  DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, fmt);
  if (unlikely(...) && __ratelimit(&_rs))
     __dynamic_pr_debug(&descriptor, fmt, ##__VA_ARGS__);

While descriptor metadata was clean, emitted dmesg records lacked the
pr_fmt prefix present in the !CONFIG_DYNAMIC_DEBUG fallbacks.

In 2015, commit 515a9adce0f0 ("include/linux/printk.h: include pr_fmt
in pr_debug_ratelimited") fixed the missing prefix by wrapping fmt in
__dynamic_pr_debug() with pr_fmt().  However, it also wrapped fmt in
the metadata macro:

  DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, pr_fmt(fmt));

This causes two problems:

  1. Build failure when pr_fmt() expands to multiple arguments, e.g.:
       #define pr_fmt(fmt) KBUILD_MODNAME ".%s " fmt, __func__
     Passing pr_fmt(fmt) into DEFINE_DYNAMIC_DEBUG_METADATA() expands
     across the comma in DEFINE_DYNAMIC_DEBUG_METADATA_CLS(), supplying
     4 arguments where it takes 3.

  2. Metadata pollution even for single-argument pr_fmt(): baking the
     prefix into .format breaks anchored queries such as:
       echo format "^foo" > /proc/dynamic_debug/control

Drop the pr_fmt() wrapper from DEFINE_DYNAMIC_DEBUG_METADATA() in
pr_debug_ratelimited(), restoring consistency with dynamic_pr_debug,
dev_dbg_ratelimited, and net_dbg_ratelimited.  Update
lib/test_dynamic_debug.c to exercise pr_fmt() with __func__ in
pr_debug_ratelimited().

Reported-by: Philipp Hahn <phahn-oss@avm.de>
Link: https://lore.kernel.org/lkml/a5e3c89fe5f4126873d58dd3472e66c56550ff91.1773779753.git.phahn-oss@avm.de/
Fixes: 515a9adce0f0 ("include/linux/printk.h: include pr_fmt in pr_debug_ratelimited")
Cc: Jason A. Donenfeld <Jason@zx2c4.com>
Cc: Petr Mladek <pmladek@suse.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/printk.h   | 2 +-
 lib/test_dynamic_debug.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/printk.h b/include/linux/printk.h
index f594c1266bfd..cd29fb467b05 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -742,7 +742,7 @@ do {									\
 	static DEFINE_RATELIMIT_STATE(_rs,				\
 				      DEFAULT_RATELIMIT_INTERVAL,	\
 				      DEFAULT_RATELIMIT_BURST);		\
-	DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, pr_fmt(fmt));		\
+	DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, fmt);			\
 	if (DYNAMIC_DEBUG_BRANCH(descriptor) &&				\
 	    __ratelimit(&_rs))						\
 		__dynamic_pr_debug(&descriptor, pr_fmt(fmt), ##__VA_ARGS__);	\
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 77c2a669b6af..cf1e3b5f6f0f 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -6,7 +6,7 @@
  *      Jim Cromie	<jim.cromie@gmail.com>
  */
 
-#define pr_fmt(fmt) "test_dd: " fmt
+#define pr_fmt(fmt) "test_dd: %s " fmt, __func__
 
 #include <linux/module.h>
 
@@ -155,7 +155,7 @@ static int __init test_dynamic_debug_init(void)
 
 static void __exit test_dynamic_debug_exit(void)
 {
-	pr_debug("exited\n");
+	pr_debug_ratelimited("exited\n");
 }
 
 module_init(test_dynamic_debug_init);

---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261125-pr-fmt-1ab0985ffaae

Best regards,
-- 
Jim Cromie <jim.cromie@gmail.com>


