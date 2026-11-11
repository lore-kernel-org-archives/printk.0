Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412241;
	b=T1YPUZ4uwiyQtW7GqwKxnk0sHmNZn1JnmwHZy6M8Lcn2VQyzxOf7fiL+aGlxtXS0JE/8
	 fAh/OCzdP9p63dzpNHqKgmHEj48PwuSfVcGqpX8zA0ezaQHt/gUX1Lq2Lg0pghPW20iKD
	 kzFvxo1ykLAvZ0JK3FzZKTkrSeSvfDiqa1zBGdRV0pTaHG8Mj+z/uSmuRoaN/iXu4+2XV
	 Rp8PQtRYectjeaZp2Xmrqqm7hGMkMCxDgqA11d+cJ+CjJyLY52Qrt0BooWZXGJr/NDC/D
	 rEgZtCDdgD4Sa6TO5pOqC76apsviR0yaCj3E1vWbhK4Gy4YEqzlRdEoXN/oJOUPM6DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=q0ul2iCfXva9OKXvM0B4+popXah+05qzWOawysX61+c=;
	b=sM879w3SsV6pHAbBQApaC5wPlgnlCxWxlBBEKmYnxZvG4WeZpdt+vk0rvWiv03gn9PI4
	 KR754FHH+9V1t/LkbXXtyRkn+Aof1e3BXkisLvhgnjoBS/ztnxIwamOQaQbCclNSh4DtP
	 t22nOTX5tmymKiUjOpZrfeTN/hzwTzOWsXx7/tfkDuP8DEwPKZBLEAi2cyezMVownCd+h
	 U0zGy2lA57h8FjXkq8QSZc+X0tPjMlruRf9o69x4rjlk8giftf4ha/z/tvGBlSmvo1A61
	 oDblqjgdswo9z3c4D/tKjpBP7JiLwDRbpRsgVFYvPhD1Tf0gniCPx+58g49xRLkxMeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ekEmoBMU;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E5A606A890
	for <printk@lists.linux.dev>; Wed, 11 Nov 2026 15:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8E5A606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ekEmoBMU
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1799973f8f.0
        for <printk@lists.linux.dev>; Wed, 11 Nov 2026 07:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794412239; x=1795017039; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q0ul2iCfXva9OKXvM0B4+popXah+05qzWOawysX61+c=;
        b=ekEmoBMUxwu/8XmFA0nGghfSYbuIposjk77IqczDH5UoZD+QzE//0esebYg/UlOINd
         fQnplMehhIQnjAiNPeqVmghcVEB7FFkayIuaywWU/Om0uiZOtZSyEGTkEd8olMS57YZV
         RAAHIxs+kZp29XifTRcIPE1OR3Dn2tBBQH1cTYBVehCOhzj1cPFPIR26dQkyPsPCmiG8
         PUg/lDetPwpyhIqJL3gvJFgsv/W7ueQooXoR8OQ7DTnRUe2/RAlQO7G5sw1X3+h4P+Oc
         YTt2mfwVB4h9PAAyitV9XSod6itxa7vjgu8i2mA5SPQO7hotrIoJDgYrANXCIXN4IdLg
         RzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412239; x=1795017039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q0ul2iCfXva9OKXvM0B4+popXah+05qzWOawysX61+c=;
        b=wCSFtEfUo1iAPuvV3RaFKvWq14zEo4spPwnuAGmtmXyaR5R8uR2bbLWjqkzPbIpPRh
         aQLaYEevMdRG1WlVHNG2SlBah35fIoi34jbAq2LAwuOKAsv06pvO9doO4+5+lrNdDa9M
         sb1i/1+7dObLElSFpoHKF57+T5TKCm1wCZbnDcs2kbX+sSodK7mO2vgxOxxUnrw0qYi1
         3IOB+0P4PYjpC0imDnFgktS7Af80AARgIGI8I1IdnrGt8cjnsUnhbvouPwoW12WZmfs1
         pFe5Hw64JKFwKo8uIpPUcmL+WoGx9fXc0N9Yxz8jeUGCCnuwQ3QUQeRZk0Osy9buDPeB
         1bxw==
X-Forwarded-Encrypted: i=1; AL+hErG6Nq0diIThrkLYJB1ljyopMi9lGMjHIier3+KnM9k2RDiCrQY4qEaGEucalTE3WlLu5DG+Ows=@lists.linux.dev
X-Gm-Message-State: APuU4Z/CHexxTvpBHbp+thuVlYJrovis+irKYT138wNkMFzK8UHE12Bj
	mHyPDnfJvusL+f9YN76/4DxwRhvmK769QA3pNKtGhhsnoSWJE/pBuMXesE21dRf3BqM=
X-Gm-Gg: AYBFou2z4X/tv3nA92+GXwk8b/ofqqlx1Ed20F+0DQL7duIlXy8MhfMZ079NQLwYoNe
	3ypHwRCRY0lhMn2qSUZyzeyxy6iZSUVNXA66lyjyJd2kwvGasuRvXNT03VqrBxHMRKz31MuNS+8
	3TchY2Nu832UlPpklIAnk2Dng7IYst2/BWTdeM2oxJmIeAjtO/jH+QHuRTgYJ2m2S+MxFg+5N5B
	rbfv0jrUVziAfV61tzSBIeCdggu2Uorh5bGtO8ZHrliTIl22IDOOQD+iN+0hev7Zf4/5LmTJZOE
	Z4+KgFFQEMQxWurfZ7ntghdht1b1FLrwQwYEozstK9HSbs+F8byHRA0QsOQAK2Z7uNMh3Y4jnpD
	hG3Feaw1Y09g/PZ3HV25zW5Wl9KyIiUt+j+YzJoPbEHanki0YE0yM+ZcyssYk0UzvxPk5mBC321
	wUEXsEIvZXzI1FSEh9YYdT0xiM2dTi+RVjoXx17/gVIUQhZxMsOWe5EIFSagqa/Ix3yFt5oqMmR
	R52LcKNEy3vyhGwo6c07jB8W2op7Box27Gfk4y3ulxLgXbtRe9ft3Q1eyP+wVHuUeOWf7jU35eH
	sr/AWo94+H2hCX8hMbKDC/QwfhDAFWs=
X-Received: by 2002:a05:6000:18a9:b0:491:4e13:fde5 with SMTP id ffacd0b85a97d-499c3b9ff33mr5184746f8f.8.1794412239118;
        Wed, 11 Nov 2026 07:50:39 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3f4esm12637013f8f.53.2026.11.11.07.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:50:38 -0800 (PST)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v7 11/17] console/braille: Lock console->setup() call during the registration
Date: Wed, 11 Nov 2026 16:48:10 +0100
Message-ID: <20261111154816.71103-12-pmladek@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111154816.71103-1-pmladek@suse.com>
References: <20261111154816.71103-1-pmladek@suse.com>
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

In braille_register_console(), the console->setup() callback must be
called while holding the console_lock. This prevents a race condition
with a possible active boot console that might be using the same hardware
registers.

See also the commit 801410b26a0e ("serial: Lock console when calling into
driver before registration").

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260423130015.85175-1-pmladek%40suse.com
Suggested-by: John Ogness <john.ogness@linutronix.de>
Signed-off-by: Petr Mladek <pmladek@suse.com>
Acked-by: Chris Down <chris@chrisdown.name>
---
 drivers/accessibility/braille/braille_console.c | 10 +++++-----
 include/linux/console.h                         |  1 +
 kernel/printk/printk.c                          |  8 +++++++-
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/accessibility/braille/braille_console.c b/drivers/accessibility/braille/braille_console.c
index 1b79b4d88bac..bc338e57d8ef 100644
--- a/drivers/accessibility/braille/braille_console.c
+++ b/drivers/accessibility/braille/braille_console.c
@@ -408,11 +408,11 @@ int braille_register_console(struct console *console, int index,
 		console_options = "57600o8";
 	if (braille_co)
 		return -ENODEV;
-	if (console->setup) {
-		ret = console->setup(console, console_options);
-		if (ret != 0)
-			return ret;
-	}
+
+	ret = console_call_setup(console, console_options);
+	if (ret != 0)
+		return ret;
+
 	console->flags |= CON_ENABLED | CON_BRL;
 	console->index = index;
 	braille_co = console;
diff --git a/include/linux/console.h b/include/linux/console.h
index cb8be9ea4a76..b68279a22514 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -710,6 +710,7 @@ enum con_flush_mode {
 };
 
 extern int add_preferred_console(const char *name, const short idx, char *options);
+extern int console_call_setup(struct console *newcon, char *options);
 extern void console_force_preferred_locked(struct console *con);
 extern void register_console(struct console *);
 extern int unregister_console(struct console *);
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 60ae813769b4..cc6c2e829b1d 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3960,7 +3960,13 @@ static int __init keep_bootcon_setup(char *str)
 
 early_param("keep_bootcon", keep_bootcon_setup);
 
-static int console_call_setup(struct console *newcon, char *options)
+/*
+ * The function is intended only for the generic console registration code.
+ * It has been made global only for the Braille console driver which
+ * is partly using the generic console registration code but it is
+ * integrated with VT code instead of printk().
+ */
+int console_call_setup(struct console *newcon, char *options)
 {
 	int err;
 
-- 
2.56.0

