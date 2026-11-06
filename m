Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985681;
	b=MuhkFW7nizbF/lyMgITgaVTcYi/H8x6SgoLo4yCa6Q3kMd1YgGtHb+mLVAuSwrfGymh4
	 Ek2PlIwBxvZpbKoR4pahGQ2uY/7KRS1F3trL/XYsJr+rfb3G0CsEvqGLP371ZYuy51V6y
	 u7cu+yNXP1GF5kmjeHo/ZsXngurBxvdfu0KF67j2E0m7L8DzOALyqJ58XFMlSYjfEQFMZ
	 Jf4B07AcCdCy6FgvMRtHVNR9TtN/cpctbTBNLEsNYyO8/Q0injkd58i0SI7ksVksVZ+xa
	 0meLWsc0BhoURAp9nkAlO+eXLsiU4uuMR6TN5GM2WaEbvnyKz9Tbq9bUDR6G3dWYF/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2Ds5XNs2vdMGzsPfxJIaAzznKPyif8n2Gl3srLqCN/Q=;
	b=GRJVsHMbQBjkgNutFrYfiyRO4DPnNKfCJFHD4fUsIyuYPwe/xnTz6flJ23JWLnC69w4a
	 V3c326Ja8d88EBxHJZy0kteHfJ8g9kzDhsq9WEBUTweiNfis3cNa7X3Cq4cnS90rjZU5f
	 AlJTJERGWp0Cio5ihFOd2kvu8DG5qTV7ucoejRKwas3ylImt1VLDeGWSpCSRQ01Y4bBx3
	 9ZjyDOFvLuspiDRtbzkGNq1UaaV/tqbv88dFzL21PjxzIIxWuYN4+9V3mi/Oyqyd0MDa3
	 CaHPN0frQ8OlQY8487a5PVv3lPJ4VHipEIYBZC03TIRau+yo6tQySbpWIW+qcyZY4rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DyaMSwXo;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C4B606A338
	for <printk@lists.linux.dev>; Fri,  6 Nov 2026 17:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1C4B606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DyaMSwXo
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e47347279so545284f8f.1
        for <printk@lists.linux.dev>; Fri, 06 Nov 2026 09:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793985679; x=1794590479; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Ds5XNs2vdMGzsPfxJIaAzznKPyif8n2Gl3srLqCN/Q=;
        b=DyaMSwXolUa4bF2Vaz/arHf57viWyZ8HdULi16wzzYzwxeFztBozGyacp1071YO056
         RrqLUSkoV2beSjiHXuyd5LgqJrTASTmi0HyAWbzNYhn8u1a52bYiR8R2eNCY0laeVNPl
         9hdRxDvJNt0UsZmu5rwb9DM4tYQAIBcNrSgzpok0njamh+8cEPoambI+Xsb2tUK2Vtno
         Ih0LJyL4gNtpv6Do+JotCHhbJfO1ZfV5RKQxlk6uWbuJKbPVIvX5Ub0nPJtBtPcU9O2I
         U9BOexWgp3buRWxWpPTaUaNOBxSYDTINbUs0EqVelTJnKfN61yDWH11byY0Gj3bb+9xu
         SK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985679; x=1794590479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Ds5XNs2vdMGzsPfxJIaAzznKPyif8n2Gl3srLqCN/Q=;
        b=2FTDTNlBXiF9tFfiYC9wePkBP4IbpeTXDrJAPafzMJuzJxRYJOTML8yiRBUhyawhhP
         J8TkitfTjQvWfH0Vy5Je9Ru//3nKJiyKuwJJQ4X6cnxh0KC8VLx3CaKbSp5z8/Ks5GH4
         q4QWxF4uEfidK34HWy2ZWmY16chxy60djm7T4NDjiGzd+l7AIgYWHDNUjHSMlR8c4HLL
         5NaRkVSXxPqg/7OO3RI1ylN1UGB46mor41VZZLDVWDPQgrfadmg78THxUow7q4s3pk7x
         DHOX8aXCjM+PI56mRZPJZ83IEr2NseSfIeQjvnsXEjUFcx7XAgDMFIHNlWVlvVSMsizJ
         u2yQ==
X-Forwarded-Encrypted: i=1; AKwUvByuoSlLGFYQ5dprh8y1KIIhDZ8MjE7ex9huLob5VtHzNV04LtJoa09Pvf/CR9Fk7/xKXN/wT/Q=@lists.linux.dev
X-Gm-Message-State: APuU4Z/pHU472ewJ0Wc34rUpxqd8bK7IswZ7guEGV8wAzSVwXxjUOR43
	VRWswdPrPKMQDuSifIz+5vNWiQkV2IwLXWqJsxeheBeIUG9W5usuKra29ku+/QLY6VE=
X-Gm-Gg: AYBFou2U7PesCCz/P5kXl3AKuyrg+jSbHYxasjKGsiSchOuPv+kcgio4rsLcBnlMc8q
	YgJBUojqRvVrGvEIOhiGd3otqAF4Yb5fNJ263fpQrRYlmfGvqLb4HV6OxQ/eTV5np1uPC3+K/JD
	SsU7QACQ7Qie2xQNKq3BLyKN9vzBbSs23+AWbvbuOrL0vHgveqikfF2bw7IMfoQ6eosE9YHSfvT
	TZLFncFB18yKnDe9toVq6xpt6YN0ftXxEWAUhUwIEu22bjm+WvB0THs6KNnEgukSMM6PLsd0QR0
	L5ueDzXym/ZEhYJIQvWiRG/2P2a7k2XyAqGJyEaP5UATWDBWFVkMb46Sdxaism+hHvSkSwiBf8X
	XRt/eBIevOZfqhAbQSj8yDLr06kcgkj/j1oSdiOno6UqxRp+KrKYQ9kOM18LPk9S5LlOYdqsz3w
	9O74+n/paETrQ6qHTler2AP2lYu4gCu4SFory0dRuU6H/awACueoXJZ6C4lAVuhLDAl3frmhaOH
	juAVtkK8y+GY3Wj1RQ83FifYwQof0l62dqPaN8YSWM+o6h+Kg4lwMXZ26ZlDmQB0UyL9TbIQYvk
	BArNPO20gAWSHTmGpwF1YQ16EjcTe5EQ
X-Received: by 2002:a05:600c:609b:b0:4a1:cef3:fb3a with SMTP id 5b1f17b1804b1-4b6ddee327bmr56162785e9.9.1793985679494;
        Fri, 06 Nov 2026 09:21:19 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e24012c3sm68262245e9.13.2026.11.06.09.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:21:19 -0800 (PST)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v6 05/16] printk: Do not accept an empty name or devname as a preferred console
Date: Fri,  6 Nov 2026 18:19:41 +0100
Message-ID: <20261106171952.207909-6-pmladek@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106171952.207909-1-pmladek@suse.com>
References: <20261106171952.207909-1-pmladek@suse.com>
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

The current code for storing preferred consoles does not expect
the case when an empty string is passed via @name or @devname.

Empty console driver name does not make any sense. Avoid handling
such entries completely.

Suggested-by: Chris Down <chris@chrisdown.name>
Reviewed-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index b7543fea865b..6bba67e142e1 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2558,7 +2558,9 @@ asmlinkage __visible void early_printk(const char *fmt, ...)
  *
  * The function adds or updates an entry in preferred_consoles[] array. Also
  * it updates some global variables which are used to make the right decisions
- * in register_console().
+ * in register_console(). Finally, it enforces some rules:
+ *
+ *   1. Do not accept empty @name or @devname.
  */
 static int add_or_update_preferred_console(unsigned int i,
 					   const char *name, const short idx,
@@ -2576,6 +2578,11 @@ static int add_or_update_preferred_console(unsigned int i,
 	if (!name && !devname)
 		return -EINVAL;
 
+	if ((name && !name[0]) || (devname && !devname[0])) {
+		pr_err("Adding a preferred console with an empty name\n");
+		return -EINVAL;
+	}
+
 	/*
 	 * We use a signed short index for struct console for device drivers to
 	 * indicate a not yet assigned index or port. However, a negative index
-- 
2.56.0

