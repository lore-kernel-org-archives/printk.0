Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794241829;
	b=0p/7X2blwHBJ5UTwnlKRvEChWJ+J2FbzSj3GYhR2KzMwMfxYsK8yLLauv1okIlgsaASg
	 MS5iRIfolQtd078d+r5EegcutHv6/sF+3uE5mWTQ+3PXb/ndjS5eVSqd7x1kXeHSoCgE7
	 /usXPwpnwrgd5usz4DUJiCxM2d1s8/gzn4mOX6TbGbALjZiRcLui7krfo6BRNsfd2LQ6B
	 tpzaX3z49PZjBh5PD3RUx4DB2qBWbfsA1JY4qb66XeARF49n1/hyGqsayaSeiwwe35RVp
	 wkNAg0UY6f9FilBZrDBaPHR0j/ppLzYUkp4VPcvHHGxFlSvfG403p1MBLD/QstG5ZHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794241829;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=j6W2NjxbKyTpJpsuputqmw55aHmjyy0nQAHdn7UNx/U=;
	b=Zlawdp3R9qK0eRF1xPQH0YHw7MYPjuKHzgEYFzxd/UaTxTCOUZltYoSn2j92+ixcI5hi
	 flCWT3cFmNgURazRAGO+gl40fKGPVePSaHXeKPw04Wjk9Fh5H1WEK4pXByFTYD0Qdrnc8
	 o80OwwaASTY262oOnIsTqMsnD9T2yUNPAktksge/jrbokHPV144fkQaF4K6d+1dH/3n88
	 Hvet4vo2OoI/+CjO3x2X0/O6T7Drw2mjSLf4E8MBy1DSwBwdXxw1bUU2dkYVagnNYs9lO
	 itR433wp2z5kFwCFF7+PdKT5xA1zp9sg30+T+X5M+ocvMBNRJyMYPYKHORRdRi14cpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=YH+QX+ho;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=lXvxpDhv;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5393E606A321
	for <printk@lists.linux.dev>; Mon,  9 Nov 2026 16:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5393E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=YH+QX+ho;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=lXvxpDhv
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794241827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j6W2NjxbKyTpJpsuputqmw55aHmjyy0nQAHdn7UNx/U=;
	b=YH+QX+ho1jK7G1ig2Q2mLe7BQmoYXgaK7f+//s2ZUcMfXHaQjM39IFMpxuB1XZJihUAsjL
	fgdYF8QrgrUJgf1oz7H2yeRygTtgIrIzYbGyBPgagaXtBEtMQ356tqjiWZsVnUjbu1yBLi
	ivVctFpTJc/K0UaBlFgHSF1WdMGNw1yiDuyH6TgcgpWtaBwd6WUP1YpiUgY6J91tmSy0KP
	P7ApX9/vRROLXaOjPWotLKYkMO9uQatNtCnYfUqAm5y5AzBQUAwTuR7R4ZWr8NvAaVjiX9
	Yj8z1GEvAnVi0vkjKzz+9/HrpiaoLQrIOXA030k/9ldKjSOvofamipmkEOf4fA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794241827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j6W2NjxbKyTpJpsuputqmw55aHmjyy0nQAHdn7UNx/U=;
	b=lXvxpDhv0V858zUTPfyTaHsi2g5eigDqefLcw4vi0+Fdyf/VwrP3C3DmvdJWEIWs1xNg0W
	ivofs3p4rMOmTkCg==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Marcos Paulo de Souza <mpdesouza@suse.com>, Chris
 Down <chris@chrisdown.name>, Naveen Kumar Chaudhary
 <naveen.osdev@gmail.com>, printk@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 00/16] printk: Clean up preferred console handling
In-Reply-To: <avHqqoJO8C15LkpG@pathway.suse.cz>
References: <20261106171952.207909-1-pmladek@suse.com>
 <avHqqoJO8C15LkpG@pathway.suse.cz>
Date: Mon, 09 Nov 2026 17:36:27 +0106
Message-ID: <87o6bynf18.fsf@jogness.linutronix.de>
X-Mailing-List: printk@lists.linux.dev
List-Id: <printk.lists.linux.dev>
List-Post: <mailto:printk@lists.linux.dev>
List-Help: <mailto:printk+help@lists.linux.dev>
List-Subscribe: <mailto:printk+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:printk+unsubscribe@lists.linux.dev>
List-Owner: <mailto:printk+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On 2026-11-09, Petr Mladek <pmladek@suse.com> wrote:
> I have the fixes mostly ready. I wonder whether you would prefer that
> I send v7 or you have already started review of v6.

I did not have a chance to start with v6, so I will wait for v7.

John
